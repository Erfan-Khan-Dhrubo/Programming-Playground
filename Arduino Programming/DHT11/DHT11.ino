#include <DHT.h>
// Includes the DHT library
// Provides functions to easily read temperature and humidity from a DHT sensor.

#define DHTPIN 4
// The data pin of the DHT11 is connected to Arduino digital pin 4.  

#define DHTTYPE DHT11
// Tells the library which sensor you’re using (could also be DHT22, DHT21).

DHT dht(DHTPIN, DHTTYPE);
// Creates a DHT object named dht, configured to use pin 4 and the DHT11 sensor type.

void setup() {
  Serial.begin(9600); // Starts serial communication with the Arduino IDE Serial Monitor at 9600 baud.
  dht.begin(); // Initializes the DHT sensor (gets it ready for use).
  Serial.println("DHT11 Test Started"); // Prints "DHT11 Test Started" to confirm setup.
}

void loop() {
  float t = dht.readTemperature(); // Reads the temperature in °C from the DHT11. Returns NAN (Not A Number) if the read fails.
  float h = dht.readHumidity(); // dht.readHumidity(); → Reads the humidity in %. Also returns NAN if it fails.

  if (isnan(t) || isnan(h)) {
    Serial.println("Failed to read from DHT sensor!"); // isnan() → checks if the value is Not A Number
  } else {
    Serial.print("Temperature: "); Serial.print(t); Serial.print(" °C, ");
    Serial.print("Humidity: "); Serial.print(h); Serial.println(" %");
  }

  delay(2000); // Wait 2 seconds before next reading
}
