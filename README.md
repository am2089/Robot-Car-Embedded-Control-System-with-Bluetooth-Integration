
# 🚗 BLE-Controlled Robot Car | Embedded Systems + iOS

A real-time robot car controller built with an ESP32 and a custom Swift-based iOS app. This project bridges embedded systems engineering with mobile development and demonstrates my ability to build and optimize a full-stack hardware-software solution.

---

## 👨‍💻 Project Overview

This was my first embedded project integrating hardware and software via Bluetooth Low Energy (BLE). I built an iOS app that connects to an ESP32-powered robot car, enabling directional control through a clean, mobile interface.

The goal was to explore real-time systems, embedded communication, and performance tuning — and to challenge myself by going beyond just app development into system-level thinking.

---

## 💡 Key Highlights for Recruiters

| Skill | Demonstrated |
|------|--------------|
| **Embedded C/C++** | Programmed ESP32 for real-time BLE handling and motor control |
| **Bluetooth Low Energy (BLE)** | Integrated CoreBluetooth in iOS and handled GATT services on the ESP32 |
| **Latency Optimization** | Reduced BLE response time by **41%** through testing and code refactoring |
| **Testing Methodology** | Designed and ran **15+ response-time tests** to quantify improvements |
| **iOS App Development** | Built full-featured companion app with Swift + CoreBluetooth |
| **Debugging** | Solved power, timing, and BLE connectivity issues across two platforms |

---

## 🛠️ Challenges I Solved

- **Power Issues:** Motors caused voltage drops. I analyzed the hardware behavior and adjusted my power supply to maintain stable output under load.
- **Cross-Platform Bugs:** BLE communication bugs were hard to trace. I implemented better error logging and handling on both the ESP32 and iOS side to debug mismatches and ensure reliable communication.
- **Latency:** I ran 15 command-response timing tests and made changes on both firmware and app side — including BLE interval tuning and removing redundant logic — to bring response time down from **0.61s to 0.36s**.

---

## 🧪 Testing & Optimization

This project wasn’t just about making it “work” — I wanted it to be **responsive** and **reliable**. I treated latency like a real-world performance bug:
- Measured delay with manual stopwatch tests
- Tuned BLE characteristic settings
- Refactored command parsing and state handling

---

## 🧰 Tech Stack

- **Hardware:** ESP32, L298N Motor Driver, DC motors, battery pack
- **Embedded Software:** C/C++ (Arduino core), BLE GATT server
- **Mobile App:** Swift, CoreBluetooth
- **Testing:** Manual response-time testing, Serial logging

---

## 🎥 Demo

▶️ [Watch the robot car in action](https://youtube.com/shorts/nL0a-RCpjPM?feature=share)

---

## 🤝 Open to Collaboration

This project is open source and available for iOS devs



