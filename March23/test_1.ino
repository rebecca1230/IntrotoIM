/* 
Introduction to IM
Arduino 1st Assignment: Who are the Dancing Friends? 
Creator: Rebecca Huang 
Date: March 23, 2021.
 */

// the setup function runs once when you press reset or power the board
void setup() {
  pinMode(12, OUTPUT); //set 12 as the output
  pinMode(11, OUTPUT); //set 11 as the output
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(12, HIGH); //turn the LED on (HIGH is the voltage level)
  digitalWrite(11, LOW); //turn the LED off
  delay(1000); //after one second
  digitalWrite(12, LOW); //turn the LED off by making the voltage LOW
  digitalWrite(11, HIGH); //turn the LED on
  delay(1000); //after one second
}
