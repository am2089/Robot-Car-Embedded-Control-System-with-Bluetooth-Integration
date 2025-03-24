
# 🚗 BLE-Controlled Robot Car | ESP32 + iOS App

This project connects a robot car powered by an ESP32 microcontroller to a custom iOS app via Bluetooth Low Energy (BLE). It demonstrates real-time embedded control, BLE communication, and cross-platform system integration between mobile and hardware.

---

## 📱 Project Overview

This was my first full integration of embedded systems and mobile development. The iOS app sends directional commands (forward, backward, left, right, stop) to the ESP32, which controls the car’s motors using GPIO pins and a motor driver. The goal was to explore real-time responsiveness, wireless control, and performance tuning.

---

## 💡 Key Highlights

| Area | Description |
|------|-------------|
| **Embedded C/C++** | Programmed the ESP32 to handle BLE connections and motor control logic |
| **BLE Communication** | Built a GATT server on the ESP32 and used CoreBluetooth on iOS to connect |
| **Latency Testing** | Reduced command response latency by **41%** (0.61s → 0.36s) using iterative optimization |
| **Debugging** | Implemented cross-platform error handling and tested over 15 command-response cycles |
| **iOS App** | Designed a clean Swift-based app to send BLE commands and handle connection states |

---

## 🛠️ Challenges & Solutions

- **Voltage Drop:** The motors drew more current than expected. I analyzed the power behavior and adjusted the battery setup to stabilize performance.
- **BLE Stability:** Initial connection issues were resolved by improving error handling and logging on both the ESP32 and iOS sides.
- **Responsiveness:** I ran manual timed tests (15+ iterations), identified code bottlenecks, and optimized both BLE settings and app-side logic to reduce latency.

---

## 🧪 Testing & Optimization

The project went beyond functional success. I focused on making the system **responsive and reliable**:
- Timed BLE command-to-response cycles manually
- Refined BLE characteristic updates
- Removed redundant code in both firmware and app layers

---

## 🧰 Tech Stack

- **Microcontroller:** ESP32 (built-in BLE)
- **Embedded Language:** C/C++ using Arduino core
- **Mobile App:** Swift (CoreBluetooth)
- **Motor Driver:** L298N dual H-bridge
- **Power:** Battery pack for motors and logic
- **Tools:** Serial Monitor for debugging, stopwatch-based latency testing

---

## 🚀 Getting Started

### Hardware
- ESP32 board
- L298N Motor Driver
- DC motors and chassis
- Power supply (battery pack)
- Jumper wires, breadboard

### Software
- Arduino IDE or PlatformIO
- Xcode (iOS app)
- UUID generator for BLE services/characteristics

---

## 📲 Usage

1. Clone or download the project.
2. Replace BLE UUIDs with your own (can be generated at [uuidgenerator.net](https://www.uuidgenerator.net/)).
3. Ensure Bluetooth permissions are added in `Info.plist` for iOS.
4. Upload the ESP32 firmware.
5. Launch the iOS app and connect to your robot.

---

## 🎥 Demo

▶️ [Watch the Robot Car in Action](https://youtube.com/shorts/nL0a-RCpjPM?feature=share)

---

## 🤝 Contributions & Learning

This project is open source for anyone learning embedded development, Bluetooth integration, or mobile-hardware communication. Contributions and feedback are welcome.

---

## 📬 Contact

**Andrew Muniz**  
📧 andrewjosephmuniz@gmail.com  
🌐 [](https://www.linkedin.com/in/andrewjosephmuniz/)
