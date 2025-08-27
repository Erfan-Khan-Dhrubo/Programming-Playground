#include <Wire.h>
#include <MPU6050.h>

MPU6050 mpu;

const int buzzerPin = 3;

// thresholds for fall detection (adjust as needed)
float lowerThreshold = 0.5;  
float upperThreshold = 2.0;  

void setup() {
  Serial.begin(9600);
  pinMode(buzzerPin, OUTPUT);

  Wire.begin();
  mpu.initialize();

  if (!mpu.testConnection()) {
    Serial.println("MPU6050 connection failed!");
    while (1);
  }
  Serial.println("MPU6050 ready!");
}

void loop() {
  int16_t ax, ay, az;
  mpu.getAcceleration(&ax, &ay, &az);

  // Convert to g's (assuming ±2g range, 16384 LSB/g)
  float Ax = ax / 16384.0;
  float Ay = ay / 16384.0;
  float Az = az / 16384.0;

  // Compute acceleration magnitude
  float accelMagnitude = sqrt(Ax*Ax + Ay*Ay + Az*Az);

  Serial.print("Accel Magnitude: ");
  Serial.println(accelMagnitude);

  // Check for fall
  if (accelMagnitude < lowerThreshold || accelMagnitude > upperThreshold) {
    Serial.println("Fall detected! Buzzer active for 1 minute.");

    unsigned long startTime = millis();
    while (millis() - startTime < 60000) { // 60,000 ms = 1 minute
      digitalWrite(buzzerPin, HIGH);  // Buzzer ON
      delay(500);                     // Beep 0.5 sec
      digitalWrite(buzzerPin, LOW);   // Buzzer OFF
      delay(2500);                    // Wait 2.5 sec → total cycle = 3 sec
    }

    Serial.println("Alarm cycle finished.");
  }

  delay(200); // check every 200ms
}


