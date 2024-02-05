//
//  BluetoothViewModel.swift
//  Arduino Robot Controller
//
//  Created by Andrew Muniz on 1/8/24.
//

import Foundation
import CoreBluetooth

// Manages possible connection states
enum ConnectionStatus {
    case connected
    case disconnected
    case scanning
    case connecting
    case error
}

// Defines a characteristic with a UUID and name
struct characteristic {
    let uuid: CBUUID
    let name: String
}

// Constants for Bluetooth services and characteristics
let robotCarSerivce: CBUUID = CBUUID(string: "16e40b5f-15fb-4ac2-82ff-c91b7144a1bd")
let robotCarServiceCharacteristic: CBUUID = CBUUID(string: "6e6221ea-fd55-4004-9a60-c77855f71896")


// Main Bluetooth model class
class BluetoothModel: NSObject, ObservableObject{
    
    private var centralManager: CBCentralManager!
    
    var robotPeripheral: CBPeripheral?
    @Published var peripheralStatus: ConnectionStatus = .disconnected
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    //Methods for scanning, connecting, sending commands, and finding characteristics
    func scanforPeripherals(){
        peripheralStatus = .scanning
        centralManager.scanForPeripherals(withServices: [robotCarSerivce])
    }
    
    func sendCommand(_ command: String) {
        let commandBytes = Array(command.utf8)
        print("Sending command: \(command)")
        
        guard let characteristic = findCharacteristic(uuid: robotCarServiceCharacteristic) else {
            return
        }
        
        robotPeripheral?.writeValue(Data(commandBytes), for: characteristic, type: .withResponse)
    }
    
    func findCharacteristic(uuid: CBUUID) -> CBCharacteristic? {
        guard let services = robotPeripheral?.services else { return nil }
        for service in services {
            guard let characteristics = service.characteristics else { continue }
            for characteristic in characteristics {
                if characteristic.uuid == uuid {
                    return characteristic
                }
            }
        }
        return nil
    }
}


// Extensions for Bluetooth delegates
extension BluetoothModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            scanforPeripherals()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        robotPeripheral = peripheral
        centralManager.connect(peripheral)
        peripheralStatus = .connecting
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheralStatus = .connected
        
        peripheral.delegate = self
        peripheral.discoverServices([robotCarSerivce])
        centralManager.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        peripheralStatus = .disconnected
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        peripheralStatus = .error
        print(error?.localizedDescription ?? "no error")
    }
    
}

extension BluetoothModel: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard error == nil else {
            // Handle any errors during discovery
            print("Error discovering characteristics: \(error!.localizedDescription)")
            return
        }
        
        for characteristic in service.characteristics ?? [] {
            if characteristic.uuid == robotCarServiceCharacteristic {
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard error == nil else {
            // Handle any errors during service discovery
            print("Error discovering services: \(error!.localizedDescription)")
            return
        }
        
        for service in peripheral.services ?? [] {
            if service.uuid == robotCarSerivce {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Error writing value: \(error.localizedDescription)")
            peripheralStatus = .error
        } else {
            print("Value written successfully")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Error receiving characteristic value: \(error.localizedDescription)")
        } else {
            print("Received characteristic value: \(characteristic.value!)")
        }
    }
    
}


