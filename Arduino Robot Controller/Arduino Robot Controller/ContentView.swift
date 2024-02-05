//
//  ContentView.swift
//  Arduino Robot Controller
//
//  Created by Andrew Muniz on 1/1/24.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    @EnvironmentObject var bluetoothModel: BluetoothModel
    @State private var connectionStatus: ConnectionStatus = .disconnected
    
    var body: some View {
        
        VStack {
            Button(getConnectionStatusText()) {
                bluetoothModel.scanforPeripherals()
            }
            .foregroundColor(connectionStatus == .connected ? .green : .red)
            .buttonStyle(.bordered)
            .controlSize(.extraLarge)
            
            Spacer()
            
            ZStack {
                
                // Remaining buttons follow as usual:
                ForEach(0..<4) { index in
                    if index != 4 { // Skip the "Stop" index already handled
                        Button(action: {
                            switch index {
                            case 0: bluetoothModel.sendCommand("Right")
                            case 1: bluetoothModel.sendCommand("Backward")
                            case 2: bluetoothModel.sendCommand("Left")
                            case 3: bluetoothModel.sendCommand("Forward")
                            default: break
                            }
                        }) {
                            Image(getDirection(forIndex: index))
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .offset(getOffset(forIndex: index))
                    }
                    
                    // Stop button goes on top:
                    Button(action: { bluetoothModel.sendCommand("Stop") }) {
                        Image(getDirection(forIndex: 4))
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .offset(getOffset(forIndex: 4))
                }
                
            }
            .padding(.bottom, 110)
        }
        .onReceive(bluetoothModel.$peripheralStatus) { status in
            connectionStatus = status
            
        }
    }
    
    
    func getConnectionStatusText() -> String {
        switch connectionStatus {
        case .scanning:
            return "Scanning"
        case .connecting:
            return "Connecting"
        case .connected:
            return "Connected"
        case .error:
            return "Connection error. Please try again."
        default:
            return "Not Connected"
        }
    }
    
    func getDirection(forIndex index: Int) -> String {
        switch index {
        case 0: return "Right"
        case 1: return "Backward"
        case 2: return "Left"
        case 3: return "Forward"
        case 4: return "Stop"
        default: return ""
        }
    }
    
    func getOffset(forIndex index: Int) -> CGSize {
        let radius: CGFloat = 90
        let angle = CGFloat(index) * (.pi / 2)

        if index == 4 {
            return .zero
        } else {
            return CGSize(width: radius * cos(angle), height: radius * sin(angle))
        }
    }
}


