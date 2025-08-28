# ❤️ Arduino Heart Rate & SpO₂ Monitor with Alert (MAX30102 + Buzzer)

This is a **beginner-friendly Arduino project** I created while **learning Arduino**.  
It uses the **MAX30102 pulse oximeter sensor** to measure **heart rate (BPM)** and estimate **blood oxygen level (SpO₂)**.  

Additionally, it has a **buzzer alert system**:
- Triggers if **BPM is too low (<50) or too high (>120)**  
- Triggers if **SpO₂ is too low (<90%)**  

This project demonstrates:
- I²C communication with sensors  
- Reading IR and Red values from MAX30102  
- Using SparkFun `heartRate.h` library to detect heartbeats  
- Adding a buzzer alert for abnormal readings  

---

## 🔧 Hardware Required
- Arduino (Uno/Nano/any compatible board)  
- MAX30102 Pulse Oximeter & Heart Rate Sensor  
- Buzzer (active)  
- Jumper wires  
- Breadboard  

---

## ⚡ Circuit Connections
- **MAX30102 VCC** → Arduino **3.3V** (do not use 5V directly unless module has regulator)  
- **MAX30102 GND** → Arduino **GND**  
- **MAX30102 SDA** → Arduino **A4** (Uno)  
- **MAX30102 SCL** → Arduino **A5** (Uno)  
- **Buzzer +** → Arduino **D3**  
- **Buzzer –** → Arduino **GND**  

> If using ESP32 or another board, check its I²C pins.  
 <img src="media/Circuit_Diagram.png"  />

---

## 🚀 Getting Started
   - Install Libraries SparkFun MAX3010x Sensor Library  
   - Connect Arduino, select board & port, click **Upload**  
   - Connect MAX30102: VCC → 3.3V, GND → GND, SDA → A4, SCL → A5  
   - Buzzer: + → D3, – → GND  
   - Place your finger on the sensor
   - Open Serial Monitor and Set **9600 baud**
---

## 🔍 Visual Overview

 <img src="media/picture_1.jpg" width="570" />
