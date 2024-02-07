# Title: 
Bluetooth Controlled Arduino Robot

# Project Description:
After learning the fundamentals of Arduino development and hardware I built a two gear robot car. 
I decided I wanted to merge my new found skills with my iOS development knowledge to bring the two together. 
My interest in iOT helped me come up with this idea. I built a iOS App that acts as a controller which connects to 
the car via Bluetooth. I used the ArduinoBLE libraries to setup the connection on the Arduino side, and Core Bluetooth framework
for the app.

![IMG_0174](https://github.com/am2089/Bluetooth-Controlled-Arduino-Robot/assets/63330690/2f8e0cf6-42ff-4270-916f-d8eb5d58c1d7)


# Challenges and Solutions:
Being the first time where I had to connect software to hardware via Bluetooth these are some challenges I faced:

1. _Voltage_: Making sure my car had the right voltage power to turn the two gears. I learned that voltage drops when the motor is on
so I had to acommodate for that.

2. _Data cable_: Using the correct usb-c cable. Due to some cable only being chargers and dont pass data. I had to find the correct cable 
that would allow me to upload my code to the micro controller.

3. _Code Bugs_: In terms of the code I had to learn a bit of c++/c since thats what Arduino's use. It was a great learning experience and 
great language to learn in general. Another problem I had was figuring out where my error was coming from in terms of connection.
I greatly implemented error handling to both Arduino and my iOS app which helped me eventually piece things together and find a solution
when I ran into a bug.

4. _Latency_: There is a small delay I am currently working on the improve response time between the controller and robot. I have reduced it by a bit
reducing the complexity of my code, and checking that the motor is outputting enough power. There is still room for improvement. 

# How to Use the Project:
1. So for the iOS App it is pretty straight forward. The only thing I would look out for is making sure you have enabled the Bluetooth permissions in your
project Plist so it can run properly.

2. Make sure you generate your own UUIDs for the services and characteristics. There are generators online where you can get them.

3. Obviously with the Robot itself your going to need a basic understanding of how the hardware works and learn the fundamentals of electronics. Depending on 
the micro controller you use is how you would set up the connection for the Arduino. I used a Arduino Nano ESP32 which had built in wifi and Bluetooth
capabilities, but you can use a bluetooth module which shouldn't be so different in terms of code setup.

# Open Source Contribution:
So I am leaving this project public so other iOS developers can use it as a jumpoff point if they want to build their own projects and connect it to iOS apps.
I also want to learn from the community. Maybe we can all together build a little super car.

Robot Car in action with App:

https://github.com/am2089/Bluetooth-Controlled-Arduino-Robot/assets/63330690/c9e44242-4f80-4bce-a9a7-d313dd6e8e9b



