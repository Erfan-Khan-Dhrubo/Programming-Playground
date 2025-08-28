#include <Wire.h>             // I2C communication
#include "MAX30105.h"         // MAX3010x sensor library
#include "heartRate.h"        // Heartbeat detection library

MAX30105 particleSensor;      // Create sensor object

// Buzzer pin
const int buzzerPin = 3;      // Connect active buzzer to D3

// Heart rate variables
#define RATE_SIZE 4           
byte rates[RATE_SIZE];        
byte rateSpot = 0;

// IR buffer
long irBuffer[100];           
int bufferLength = 100;

// BPM and SpO2
float BPM;                     
float SpO2;

void setup() {
  Serial.begin(9600);          // Serial Monitor at 9600 baud
  pinMode(buzzerPin, OUTPUT);  // Set buzzer pin as output
  Serial.println("Initializing MAX30102...");

  // Initialize MAX30102 sensor
  if (!particleSensor.begin(Wire, I2C_SPEED_STANDARD)) {
    Serial.println("MAX30102 not found!");
    while (1);                  // Stop program if sensor not detected
  }

  particleSensor.setup();                  
  particleSensor.setPulseAmplitudeRed(0x0A); 
  particleSensor.setPulseAmplitudeIR(0x0A);

  Serial.println("MAX30102 initialized!");
}

void loop() {
  // Read sensor values
  long irValue = particleSensor.getIR();
  long redValue = particleSensor.getRed();

  // Store IR values in buffer
  for (int i = bufferLength - 1; i > 0; i--) {
    irBuffer[i] = irBuffer[i - 1];
  }
  irBuffer[0] = irValue;

  // Heartbeat detection
  if (checkForBeat(irValue) == true) {
    BPM = beatsPerMinute;          // BPM from library
    if (BPM < 255 && BPM > 20) {   // Valid BPM
      rates[rateSpot++] = BPM;
      rateSpot %= RATE_SIZE;

      // Average BPM
      float avgBPM = 0;
      for (byte x = 0; x < RATE_SIZE; x++) {
        avgBPM += rates[x];
      }
      avgBPM /= RATE_SIZE;

      Serial.print("Heart Rate (BPM): ");
      Serial.print(avgBPM);
      Serial.print(" | ");

      // Trigger buzzer if BPM is too low or too high
      if (avgBPM < 50 || avgBPM > 120) {
        Serial.print("⚠️ Abnormal BPM! Buzzer ON | ");
        digitalWrite(buzzerPin, HIGH);  // Buzzer ON
      } else {
        digitalWrite(buzzerPin, LOW);   // Buzzer OFF
      }
    }
  }

  // Estimate SpO2
  SpO2 = 110 - 25 * ((float)redValue / (float)irValue); // Rough estimate
  if (SpO2 > 100) SpO2 = 100;
  if (SpO2 < 70) SpO2 = 70;

  Serial.print("Estimated SpO2 (%): ");
  Serial.println(SpO2);

  // Trigger buzzer if SpO2 is low
  if (SpO2 < 90) {
    Serial.println("⚠️ Low SpO2! Buzzer ON");
    digitalWrite(buzzerPin, HIGH);   // Buzzer ON
  } else if (!(BPM < 50 || BPM > 120)) {
    // Only turn off buzzer if BPM is normal
    digitalWrite(buzzerPin, LOW);    
  }

  delay(1000);  // Wait 1 second before next reading
}
