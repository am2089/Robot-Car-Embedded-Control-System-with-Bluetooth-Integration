#include <BLEDevice.h>  // Include necessary libraries for Bluetooth communication
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>

// Define pin assignments for motor control
const byte IN1 = 7;
const byte IN2 = 6;
const byte IN3 = 5;
const byte IN4 = 4;
const byte ENA = 9;
const byte ENB = 3;

// Define PWM values for different speeds
const int normalSpeedPWM = 255;
const int slowSpeedPWM = 150; 

// Variables for Bluetooth server and characteristic
BLEServer* pServer = NULL;
BLECharacteristic *pCharacteristic = NULL;
bool deviceConnected = false;  
bool oldDeviceConnected = false;

// Define UUIDs for Bluetooth service and characteristic
#define SERVICE_UUID "16e40b5f-15fb-4ac2-82ff-c91b7144a1bd"
#define CHARACTERISTICS_UUID "6e6221ea-fd55-4004-9a60-c77855f71896"

// Function to configure motor control pins
void setupMotorPins() {
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  pinMode(ENA, OUTPUT);
  pinMode(ENB, OUTPUT);
}

// Callback class for handling Bluetooth server events
class MyServerCallbacks: public BLEServerCallbacks {
public:
  void onConnect(BLEServer* pServer) {
    deviceConnected = true;
    Serial.println("Device connected!"); 
  }

  void onDisconnect(BLEServer* pServer) {
    deviceConnected = false;
    Serial.println("Device disconnected!"); 
  }
};

// Main program loop
void loop() {
    if (deviceConnected) {
        pCharacteristic->notify();
        const char* command = pCharacteristic->getValue().c_str();
        controlMotors(command);
        delay(1000);
    }
}

void setup() {
  Serial.begin(115200);  

  // Create the BLE Device
  BLEDevice::init("ESP32");  
  
  // Create Ble Server
  pServer = BLEDevice::createServer();  
  pServer->setCallbacks(new MyServerCallbacks());  

  setupMotorPins();  

  // Set initial power value for motor control (adjust as needed)
  analogWrite(ENA, 225);  
  analogWrite(ENB, 225);  

  // Create the BLE Service
  BLEService *pService = pServer->createService(SERVICE_UUID);

  // Create a BLE Characteristic
  pCharacteristic = pService->createCharacteristic(
      CHARACTERISTICS_UUID,
      BLECharacteristic::PROPERTY_READ   | 
      BLECharacteristic::PROPERTY_WRITE  |
      BLECharacteristic::PROPERTY_NOTIFY |
      BLECharacteristic::PROPERTY_INDICATE
  );

  // Add BLE Descriptor
  pCharacteristic->addDescriptor(new BLE2902()); 

  // Start the Service 
  pService->start(); 

  // Advertise Bluetooth service
  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setScanResponse(false);
  pAdvertising->setMinPreferred(0x06);
  pAdvertising->setMinPreferred(0x12);
  BLEDevice::startAdvertising();
}

// Function to control motors based on received commands
void controlMotors(const char* command) {
    Serial.print("Received command: ");
    Serial.println(command);

    if (strcmp(command, "Forward") == 0) {
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
    } else if (strcmp(command, "Backward") == 0) {
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH);
    }  else if (strcmp(command, "Left") == 0) {
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH);
    } else if (strcmp(command, "Right") == 0) {
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
    } else if (strcmp(command, "Stop") == 0) {
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, LOW);
    } else {
        Serial.println("Invalid command received");
    }
}


