
#include <Wire.h>
#include "RTClib.h"

RTC_DS3231 rtc;

const int buzzerPin = 3;
bool alarmTriggered = false; // flag to trigger only once

void setup() {
  Serial.begin(9600);
  pinMode(buzzerPin, OUTPUT);

  if (!rtc.begin()) {
    Serial.println("Couldn't find RTC");
    while (1);
  }

  if (rtc.lostPower()) {
    Serial.println("RTC lost power, setting the time!");
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__))); // set to compile time
  }
}

void loop() {
  DateTime now = rtc.now();
  int hour = now.hour();
  int minute = now.minute();

  Serial.print("Current Time: ");
  Serial.print(hour);
  Serial.print(":");
  Serial.println(minute);

  // Trigger buzzer at 21:10 only once
  if (hour == 21 && minute == 10 && !alarmTriggered) {
    // Buzzer beeps every 5 seconds for 30 seconds
    for (int i = 0; i < 6; i++) {
      digitalWrite(buzzerPin, HIGH); // Buzzer ON
      delay(500);                     // Beep 0.5 second
      digitalWrite(buzzerPin, LOW);  // Buzzer OFF
      delay(4500);                    // Wait 4.5 seconds
    }
    alarmTriggered = true; // mark alarm as triggered
  }

  // Reset the flag after 21:10 to allow next day
  if (hour == 21 && minute > 10) {
    alarmTriggered = false;
  }

  delay(1000);
}



