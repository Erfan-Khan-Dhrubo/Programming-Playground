# 🛡️ Arduino Fall Detection System (MPU6050 + Buzzer)

This is a simple project I created while **learning Arduino**.  
It uses an **MPU6050 accelerometer & gyroscope sensor** to detect sudden falls based on acceleration magnitude.  
When a fall is detected, a **buzzer alarm** is activated for **1 minute**.  

---

## 🔧 Hardware Required
- Arduino (Uno/Nano/any compatible board)  
- MPU6050 Accelerometer & Gyroscope module  
- Buzzer (active/passive)  
- Jumper wires  
- Breadboard  

---

## ⚡ Circuit Connections
- **MPU6050 VCC** → Arduino **5V**  
- **MPU6050 GND** → Arduino **GND**  
- **MPU6050 SCL** → Arduino **A5** (Uno)  
- **MPU6050 SDA** → Arduino **A4** (Uno)  
- **Buzzer +** → Arduino **D3**  
- **Buzzer –** → Arduino **GND**  

*(If using a different Arduino board, check SDA/SCL pins.)*

 <img src="media/Circuit_Diagram.png"  />

---

## 💻 Code Explanation
1. Initializes **MPU6050** using the `MPU6050` and `Wire` libraries.  
2. Reads raw acceleration values (`ax`, `ay`, `az`).  
3. Converts them to **g-units** (using ±2g scale → 16384 LSB/g).  
4. Calculates the **acceleration magnitude**:  Magnitude = √(Ax² + Ay² + Az²)
5. If the magnitude is **too low** (`< 0.5g`) or **too high** (`> 2.0g`), a fall is assumed.  
6. The **buzzer turns on/off in cycles** for **1 minute** (beep 0.5s, pause 2.5s).  

---

## 🚀 Getting Started
1. Install required libraries in Arduino IDE:  
   - **MPU6050** (by Electronic Cats / Jeff Rowberg)  
   - **Wire** (comes built-in)  

2. Upload the code to your Arduino board.  

3. Open **Serial Monitor** (9600 baud) to see acceleration values and fall alerts.  

## 🔍 Visual Overview

 <img src="media/picture_1.jpg" />
