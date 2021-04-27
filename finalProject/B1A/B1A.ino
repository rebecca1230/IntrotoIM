/*
  Intro to IM
  Creator: Rebecca Huang
*/

#define redButton 8
#define yellowButton 6

void setup() {
  Serial.begin(9600);
  Serial.println("0,0");
  pinMode(redButton, INPUT);
}

void loop() {
  int potent = analogRead(A0);
  delay(1);
  Serial.print(potent);
  Serial.print(',');
  if (digitalRead(redButton) == HIGH) {    
    Serial.println("redOn");                 
    delay(200);
  } else {    
    Serial.println("redOff");                
    delay(200);
  }
}
