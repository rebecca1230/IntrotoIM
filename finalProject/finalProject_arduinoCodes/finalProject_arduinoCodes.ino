/*
  Intro to IM
  Final Project: Fighting COVID
  Creator: Rebecca Huang
  Due Date: April 29, 2021
*/

//Define the button pins
#define blueButton  8
#define yellowButton 6
#define redButton 4
#define greenButton 2

void setup() {
  Serial.begin(9600);
  //print five values at Processing Console
  Serial.println("0,0,0,0,0");
  pinMode(redButton, INPUT);
  pinMode(yellowButton, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(greenButton, INPUT);
}

void loop() {
  int potent = analogRead(A0);
  delay(1);
  Serial.print(potent);
  //define string indicating BLUE button of or off
  Serial.print(',');
  if (digitalRead(blueButton) == HIGH) {
    Serial.print("blueOn");
    delay(200);
  } else {
    Serial.print("blueOff");
    delay(200);
  }
  //define string indicating YELLOW button of or off
  Serial.print(',');
  if (digitalRead(yellowButton) == HIGH) {
    Serial.print("yellowOn");
    delay(200);
  } else {
    Serial.print("yellowOff");
    delay(200);
  }
  //define string indicating RED button of or off
  Serial.print(',');
  if (digitalRead(redButton) == HIGH) {
    Serial.print("redOn");
    delay(200);
  } else {
    Serial.print("redOff");
    delay(200);
  }
  //define string indicating GREEN button of or off
  Serial.print(',');
  if (digitalRead(greenButton) == HIGH) {
    Serial.println("greenOn");
    delay(200);
  } else {
    Serial.println("greenOff");
    delay(200);
  }
}
