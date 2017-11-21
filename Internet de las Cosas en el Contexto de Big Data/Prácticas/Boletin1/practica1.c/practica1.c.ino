/* 
 *  Moisés Frutos Plaza
 *  Mario Losantos Albacete
 */


#include "DHT.h"

#define PIN_SENSOR 3
#define PIN_RELAY 8
#define LED_INTERNO 13

#define DHTTYPE DHT11 
#define UMBRAL_TEMPERATURA 1
#define UMBRAL_HUMEDAD 1

unsigned long last_relay_change = 0;
unsigned long t_delay = 1000;
unsigned long tiempo = 0;
float temperatura_inicial = 0;
float humedad_inicial = 0;

int relaystatus = HIGH;
int ledstatus = HIGH;
DHT dht(PIN_SENSOR, DHTTYPE);


void abrir_relay(){
  Serial.println("abrir_relay");
  if (relaystatus == HIGH){
    digitalWrite(PIN_RELAY, LOW);
    relaystatus = LOW;
  }
}

void cerrar_relay(){
  Serial.println("cerrar_relay");
  if (relaystatus == LOW){
    digitalWrite(PIN_RELAY, HIGH);
    relaystatus = HIGH;
  }
}

float readTemperature(){
  float t = dht.readTemperature(false);
  //Serial.print("Temperatura:");
  //Serial.println(t);

  if (isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    return 0;
  }
  return t;
}

float readHumidity(){
  float h = dht.readHumidity();
  //Serial.print("Humedad:");
  //Serial.println(h);

  if (isnan(h)) {
    Serial.println("Failed to read from DHT sensor!");
    return 0;
  }
  return h;
}

void ledOn(){
  if(ledstatus == LOW) {
    Serial.println("Encender Led");
    digitalWrite(LED_INTERNO, HIGH);
    ledstatus = HIGH;
  }
}

void ledOff(){
  if(ledstatus == HIGH) {
    Serial.println("Apagar Led");
    digitalWrite(LED_INTERNO, LOW);
    ledstatus = LOW;
  }
}

void setup() {
  Serial.begin(9600);
  Serial.println("Bienvenido a las practicas de IoT!");

  pinMode(PIN_SENSOR, INPUT);
  pinMode(PIN_RELAY, OUTPUT);
  pinMode(LED_INTERNO, OUTPUT);
  temperatura_inicial = readTemperature();
  //Serial.print("Temperatura Inicial: ");
  //Serial.println(temperatura_inicial);
  humedad_inicial = readHumidity();
  //Serial.print("Humedad Inicial: ");
  //Serial.println(humedad_inicial);
  ledOff();
  abrir_relay();
}

void check_temperature(){

 float temperatura = readTemperature();
  if (temperatura > (temperatura_inicial + UMBRAL_TEMPERATURA)){
    Serial.println("demasiado calor");
    cerrar_relay();
  } else if (temperatura < (temperatura_inicial - UMBRAL_TEMPERATURA)){
    Serial.println("demasiado refrigerado");
    abrir_relay();
  }
}

void check_humidity(){

 float humidity = readHumidity();
  if (humidity > (humedad_inicial + UMBRAL_HUMEDAD)){
    Serial.println("demasiada humedad");
    ledOn();
  } else if (humidity < (humedad_inicial - UMBRAL_HUMEDAD)){
    Serial.println("poca humedad");
    ledOff();
  }
}

void print_status() {
  Serial.print("LOW=");
  Serial.print(LOW);
  Serial.print(" HIGH=");
  Serial.print(HIGH);
  Serial.print(" Estado Relay: ");
  Serial.print(relaystatus);
  Serial.print("  Estado Led: ");
  Serial.print(ledstatus);
  Serial.print("  T. Inicial: ");
  Serial.print(temperatura_inicial);
  Serial.print("  T. Actual: ");
  Serial.print(readTemperature());
  Serial.print("  H. Inicial: ");
  Serial.print(humedad_inicial);
  Serial.print("  H. Actual: ");
  Serial.println(readHumidity());
}

void loop() {
  tiempo = millis();

  //delay artificial
  if( tiempo > last_relay_change + t_delay) {
    last_relay_change = tiempo;
    check_temperature();
    check_humidity();
    print_status();
  }
}


/*
 * 
 * Falta leer humedad, con:
 * float h = dht.readHumidity();
 * 
 * y un par de funciones para encender y apagar leds
 * 
*/

