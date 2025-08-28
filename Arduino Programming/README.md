# Arduino Projects

This repository contains all the projects, code files, and circuit designs I completed during the **Summer 2025 Computer Interface course** while learning **Arduino and interfacing with sensors**.  
Each project in the repository includes:

- ✅ A `.ino` file – Complete working Arduino code  
- ✅ A `.fzz` file – Fritzing circuit design  
 

---

## 📘 Projects Covered

### ✅ 1. DHT11 Temperature & Humidity Sensor

- **Components**: Arduino, DHT11, jumper wires, breadboard  
- **Features**:
  - Reads temperature (°C) and humidity (%)  
  - Displays readings in Serial Monitor every 2 seconds  
  - Handles failed sensor readings gracefully  
- **Concepts Learned**:
  - Using external libraries (`DHT.h`)  
  - Basic Arduino I/O and Serial communication  
  - Conditional checks (`isnan`)  

---

### ✅ 2. MPU6050 Fall Detection System

- **Components**: Arduino, MPU6050, buzzer, jumper wires, breadboard  
- **Features**:
  - Detects sudden falls based on accelerometer readings  
  - Activates buzzer alarm for 1 minute when a fall is detected  
  - Prints acceleration magnitude to Serial Monitor  
- **Concepts Learned**:
  - I²C communication with MPU6050  
  - Reading raw acceleration data and converting to g-units  
  - Calculating vector magnitude: `sqrt(Ax² + Ay² + Az²)`  
  - Conditional alerts using buzzer  

---

### ✅ 3. RTC DS3231 Alarm System

- **Components**: Arduino, RTC DS3231, buzzer, jumper wires, breadboard  
- **Features**:
  - Reads current time from DS3231 RTC  
  - Triggers buzzer alarm at a specific time (e.g., 21:10)  
  - Beeps periodically for 30 seconds at alarm time  
- **Concepts Learned**:
  - Using RTC libraries (`RTClib.h`)  
  - Reading and adjusting date/time  
  - Conditional logic for triggering events once per day  

---

### ✅ 4. MAX30102 Heart Rate & SpO₂ Monitor with Buzzer

- **Components**: Arduino, MAX30102, buzzer, jumper wires, breadboard  
- **Features**:
  - Measures heart rate (BPM) and estimates SpO₂  
  - Triggers buzzer if BPM is abnormal (<50 or >120) or SpO₂ < 90%  
  - Prints results to Serial Monitor every second  
- **Concepts Learned**:
  - I²C communication and using SparkFun `MAX30105` library  
  - Heartbeat detection using `heartRate.h`  
  - Averaging BPM for stable readings  
  - Rough SpO₂ estimation using Red/IR ratio  
  - Using actuators (buzzer) based on sensor thresholds  

---

## 🔮 Key Arduino Concepts Learned Across Projects

- **Arduino Programming Basics**: `setup()`, `loop()`, variables, arrays, conditionals, loops  
- **Serial Communication**: Printing sensor data, debugging, formatting output  
- **Sensors & I²C**: DHT11, MPU6050, MAX30102, RTC DS3231  
- **Data Conversion & Calculations**:  
  - Accelerometer to g-units  
  - Vector magnitude calculation  
  - Heart rate averaging  
  - SpO₂ ratio calculation  
- **Alerts & Actuators**: Controlling buzzers for threshold-based events  
- **Project Management**: Using external libraries, structuring code, commenting, uploading to GitHub  

---

## ⚠️ Disclaimer
These projects are for **educational purposes only**.  
They are **not medical devices** and should **not be used for diagnosis or monitoring health conditions**.  
