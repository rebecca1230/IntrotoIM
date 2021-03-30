/*
  Intro to IM
  2nd Arduino Assignment
  Marry Had a Little lamb
  creator: Rebecca Huang
  Date: March 30, 2021
*/

//sensor's pin
const int LDRPIN = A2;

//LEDs' pins
const int RL = A3;
const int YL = A4;
const int BL = A5;
const int GL = A0;

//Switches' pins
const int RS = 7;
const int YS = 6;
const int BS = 5;

//set delayVale as int
int delayValue;

//the switches' digitalRead values.
const int pressRS = digitalRead(RS);
const int pressYS = digitalRead(YS);
const int pressBS = digitalRead(BS);

void setup() {
  Serial.begin(9600);
  //Set the LEDs' pins as the output
  pinMode(RL, OUTPUT);
  pinMode(YL, OUTPUT);
  pinMode(BL, OUTPUT);
  pinMode(GL, OUTPUT);
  //Set the switches' pins as the input
  pinMode(RS, INPUT);
  pinMode(YS, INPUT);
  pinMode(BS, INPUT);
  digitalWrite(GL, LOW);
}

void loop() {
  if (pressRS == HIGH) { //if red switch is pressed
    digitalWrite(GL, HIGH); //light the green LED
  }

  int sensorValue = analogRead(LDRPIN); //determine light sensor's value
  //define the value that adjusts depending on the sensor's value
  delayValue = map (sensorValue, 0, 1023, 255, 1);
  Serial.println(sensorValue); //display the serial value on the serial monitor

  //give yellow LED different brightness
  analogWrite(YL, random(10, 400));
  //yellow LED's brightness change according the sensor value
  delay(delayValue);
  if (YL != LOW) { //if detected yellow LED is bright
    digitalWrite(YL, LOW); //turn yellow LED off
  }
  //give blue LED different brightness
  analogWrite(BL, random(10, 400));
  //blue LED's brightness change according the sensor value
  delay(delayValue);
  if (BL != LOW) {//if detected blue LED is bright
    digitalWrite(BL, LOW);//turn blue LED off
  }
  delay(1000);
}
