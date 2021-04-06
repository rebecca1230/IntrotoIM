/*
 * Intro to IM
 * Rebecca Huang 
 * Musical Instrument
 * April 6, 2021
 */

const int ONE = 7;
const int TWO = 6;
const int THREE = A3;
const int FOUR = A4;
const int FIVE = 2;
const int LDRPIN = A0;
const int YS = A2;

#include "pitches.h"
#include <Servo.h>
Servo myservo;

int melody[] = {
  NOTE_C6, NOTE_C6, NOTE_G6, NOTE_G6, NOTE_A6, NOTE_A6, NOTE_G6,
  NOTE_F6, NOTE_F6, NOTE_E6, NOTE_E6, NOTE_D6, NOTE_D6, NOTE_C6,
  NOTE_G6, NOTE_G6, NOTE_F6, NOTE_F6, NOTE_E6, NOTE_E6, NOTE_D6,
  NOTE_G6, NOTE_G6, NOTE_F6, NOTE_F6, NOTE_E6, NOTE_E6, NOTE_D6,
  NOTE_C6, NOTE_C6, NOTE_G6, NOTE_G6, NOTE_A6, NOTE_A6, NOTE_G6,
  NOTE_F6, NOTE_F6, NOTE_E6, NOTE_E6, NOTE_D6, NOTE_D6, NOTE_C6, 0
};


int noteDurations[] = {
  //8 is shorter than 4
  4, 4, 4, 4, 4, 4, 2,
  4, 4, 4, 4, 4, 4, 2,
  4, 4, 4, 4, 4, 4, 2,
  4, 4, 4, 4, 4, 4, 2,
  4, 4, 4, 4, 4, 4, 2,
  4, 4, 4, 4, 4, 4, 2, 4
};


void setup() {
  Serial.begin(9600);

  //light sensor pin
  pinMode(LDRPIN, INPUT);

  //switch's pin
  pinMode(YS, INPUT);

  //LED's pins
  pinMode(ONE, OUTPUT);
  pinMode(TWO, OUTPUT);
  pinMode(THREE, OUTPUT);
  pinMode(FOUR, OUTPUT);
  pinMode(FIVE, OUTPUT);

  //the speaker
  for (int thisNote = 0; thisNote < 43; thisNote++) {
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(8, melody[thisNote], noteDuration);//SPEAKER PIN IS 8
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
  }
  //initialize the servo object ; SERVO PIN IS 9
  myservo.attach(9);
}

void loop() {
  //the larger the number is in pos of myservo.write(pos),
  //the slower will the sever move

  int sensorValue = analogRead(LDRPIN);
  Serial.println(sensorValue);
  //the sections of intending to let the LEDs flash
  //according to the sensor value
  if (sensorValue > 660) {
    analogWrite(ONE, HIGH);
    analogWrite(TWO, LOW);
    analogWrite(THREE, HIGH);
    analogWrite(FOUR, LOW);
    analogWrite(FIVE, HIGH);
  } else {
    analogWrite(ONE, LOW);
    analogWrite(TWO, HIGH);
    analogWrite(THREE, LOW);
    analogWrite(FOUR, HIGH);
    analogWrite(FIVE, LOW);
  }
  //thw switch controlling the LED
  if (digitalRead(YS) == HIGH) {
    digitalWrite(ONE, random(LOW, HIGH));
    digitalWrite(TWO, random(LOW, HIGH));
    digitalWrite(THREE, random(LOW, HIGH));
    digitalWrite(FOUR, random(LOW, HIGH));
    digitalWrite(FIVE, random(LOW, HIGH));
  }
  //the pattern of hwo the servo works at last
  myservo.write(10);
  delay(200);
  myservo.write(50);
  delay(200);
  myservo.write(50);
  delay(200);
  myservo.write(100);
  delay(200);
  myservo.write(100);
  delay(200);
  myservo.write(50);
  delay(200);
  myservo.write(50);
  delay(200);
  myservo.write(10);
  delay(200);
  myservo.write(100);
  delay(200);
}
