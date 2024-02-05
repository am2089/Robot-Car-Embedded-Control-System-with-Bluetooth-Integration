//
//  Arduino_Robot_ControllerApp.swift
//  Arduino Robot Controller
//
//  Created by Andrew Muniz on 1/1/24.
//

import SwiftUI

@main
struct Arduino_Robot_ControllerApp: App {
    @StateObject var bluetoothModel = BluetoothModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bluetoothModel)
        }
    }
}
