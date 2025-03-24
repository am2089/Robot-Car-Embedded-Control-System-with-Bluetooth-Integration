A Bluetooth-controlled robot car powered by an ESP32 and a custom-built iOS app. This project combines embedded development and mobile app design to create a responsive real-time system for controlling a physical device.

![302458991-2f8e0cf6-42ff-4270-916f-d8eb5d58c1d7](https://github.com/user-attachments/assets/f717e102-186b-4ccb-92d8-77b60d2f87ac)

📱 Overview
This project was my first time integrating hardware with an iOS app using Bluetooth. As someone transitioning from iOS development to embedded systems engineering, I wanted to merge the two worlds and explore IoT. The iOS app acts as a remote controller, sending directional commands (forward, backward, left, right, stop) to the ESP32-based robot via BLE (Bluetooth Low Energy).

🛠️ Features
✅ Bluetooth Low Energy (BLE) communication between ESP32 and iOS

✅ Real-time control: forward, backward, left, right, stop

✅ Reduced BLE latency by 41% (from 0.61s → 0.36s) through iterative testing and optimization

✅ Clean separation between embedded and app layers for easier debugging

🧠 Challenges & Solutions
⚡ Voltage Drop
Initially, the motors weren’t receiving enough power under load. I learned that motors draw more current when active, which causes a voltage drop. I adjusted the power supply to accommodate these real-world electrical behaviors.

🐛 Code & Connection Bugs
Working in C for the first time and troubleshooting BLE connection bugs pushed me to implement proper error handling on both the ESP32 and iOS sides. This helped isolate issues and improve stability.

⏱️ Latency Optimization
I ran 15 timed tests measuring response time from iOS tap to motor movement. After analyzing the BLE characteristic behavior and removing redundant code, I reduced latency by 41%. This included tuning BLE preferences and optimizing characteristic handling.

🔧 Getting Started
Hardware Required
ESP32 (with built-in BLE)

Motor driver (e.g., L298N)

DC motors + chassis

Battery pack (capable of handling motor current draw)

Jumper wires

Optional: logic analyzer or multimeter

Software Requirements
Arduino IDE (or PlatformIO)

Xcode (for iOS app)

BLE UUID generator (for custom service/characteristic UUIDs)

📲 How to Use
Clone or download this repository.

Update the UUIDs in both the ESP32 code and the iOS app using your own (you can generate new ones here).

Enable Bluetooth permissions in the iOS app's Info.plist.

Upload the Arduino code to your ESP32.

Connect the app to the device, and start driving!

🧩 Project Architecture
plaintext
Copy
Edit
[ iOS App (Swift + CoreBluetooth) ]
              ⇅
[ BLE Communication Layer ]
              ⇅
[ ESP32 (C/C++) ] --> [ Motor Driver ] --> [ Motors ]
🤝 Open Source Contribution
This project is open to the community. iOS devs and embedded enthusiasts alike are welcome to fork, remix, or contribute improvements. Whether you're learning, teaching, or building a supercar — I hope this serves as a solid starting point.

🎥 Demo
▶️ Watch the Robot Car in Action
(https://youtube.com/shorts/nL0a-RCpjPM?feature=share)https://youtube.com/shorts/nL0a-RCpjPM?feature=share




