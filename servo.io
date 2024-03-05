#include <Servo.h>

const int sensorPin = 2;   // Pin donde está conectado el sensor de proximidad
const int servoPin = 9;    // Pin donde está conectado el servomotor
const int ledPin = 13;     // Pin donde está conectado el LED

Servo myServo;              // Objeto de la clase Servo

void setup() {
  pinMode(sensorPin, INPUT);
  pinMode(ledPin, OUTPUT);
  myServo.attach(servoPin);

  Serial.begin(9600);  // Inicia la comunicación serial a 9600 baudios
  Serial.println("Inicialización completa. Esperando detección de movimiento...");
}

void loop() {
  int sensorValue = digitalRead(sensorPin);

  if (sensorValue == HIGH) {
    // Si se detecta movimiento, mueve el servomotor a 90 grados
    myServo.write(90);
    digitalWrite(ledPin, LOW);  // Enciende el LED
    Serial.println("¡Movimiento detectado! Activando el servomotor y encendiendo el LED.");
    delay(500);  // Ajusta el tiempo de espera según sea necesario
  } else {
    // Si no hay movimiento, devuelve el servomotor a su posición normal (0 grados)
    myServo.write(0);
    digitalWrite(ledPin, HIGH);  // Apaga el LED
    Serial.println("Ningún movimiento detectado. Volviendo a la posición normal y apagando el LED.");
  }
}
