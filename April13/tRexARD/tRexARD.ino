/*
Intro to IM
Creator: Rebecca Huang 
Assignment: T-Rex Game 
April 13 2021
*/
int left = 0;
int right = 0;

void setup() {
  Serial.begin(9600);
  Serial.println("0,0");
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
}

void loop() {
  while (Serial.available()) {
    //convert numerical to numbers
    right = Serial.parseInt();
    left = Serial.parseInt();
    if (Serial.read() == '\n') {
      analogWrite(3, right);
      analogWrite(5, left);
      //determine the sensors potentiometer and LDR 
      int sensor = analogRead(A0);
      delay(1);
      int sensor2 = analogRead(A1);
      delay(1);
      Serial.print(sensor);
      Serial.print(',');
      Serial.println(sensor2);
    }
  }
}
