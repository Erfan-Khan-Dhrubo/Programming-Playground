#include <Wire.h>
#include "MAX30105.h"
#include "heartRate.h" // included with SparkFun MAX3010x library

MAX30105 particleSensor;

void setup() {
  Serial.begin(9600);  // changed baud to 9600
  Serial.println("Initializing MAX30102...");

  if (!particleSensor.begin(Wire, I2C_SPEED_STANDARD)) {
    Serial.println("MAX30102 not found!");
    while (1);
  }

  // Setup with default settings
  particleSensor.setup();                  
  particleSensor.setPulseAmplitudeRed(0x0A); // LED brightness
  particleSensor.setPulseAmplitudeIR(0x0A);
}

void loop() {
  long irValue = particleSensor.getIR();
  long redValue = particleSensor.getRed();

  // Rough Heart Rate estimate
  float bpm = (irValue / 1000.0) * 1.2;  

  // Rough SpO2 estimate using RED/IR ratio
  float spo2 = 110 - 25 * ((float)redValue / (float)irValue);

  Serial.print("Heart Rate (BPM): ");
  Serial.print(bpm);
  Serial.print(" | Estimated SpO2 (%): ");
  Serial.println(spo2);

  delay(5000); // every 5 seconds
}







