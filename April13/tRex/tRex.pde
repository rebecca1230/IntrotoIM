/*
Intro to IM
Creator: Rebecca Huang 
Assignment: T-Rex Game 
April 13 2021
*/

//CODES FOR CONNECT TO ARDUINO 
import processing.serial.*;
Serial myPort;
//determine variables
int xPos=0;
int yPos=0;
int mass = 50;
int brightness;
//obstacles' variables
float obX = 640;
float obY = height - height/2 + 45;
float obHeight = 130;
float obWidth = 40;
//light on and off 
boolean onOff=false;
boolean onOff2=false;
//gameStage setting
int screen;

void setup() {
  screen = 1; 
  size(640, 360);
  xPos = width/2;
  yPos = height - height/2;
  //CODES FOR CONNECT TO ARDUINO 
  printArray(Serial.list());
  String portname=Serial.list()[7];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

void draw() {
  background(255);
  color(255, 255, 255);
  fill(0);
  //draw the track
  rect(0, height - height/4 - 45, width, 5);
  //draw the T-Rex
  rect(xPos, yPos, mass, mass);
 
  if (mousePressed) {
    if (mouseX <= width/2) { // mouse on the left
      if (brightness > 0) {
        brightness -= 10;//gradually decrease LED brightness
      } else {
        brightness = 0;
      }
      onOff2=true; //change the value of the light to true
    } else {
      if (brightness < 255) {
        brightness += 10;//gradually increase LED brightness
      } else {
        brightness = 255;
      }
      onOff=true;
    }
  } else {
    onOff=onOff2=false;
  }
  obstacle();
  collide();
}

void obstacle() { // allow the obstacle to move to the left
  rect(obX, obY, obWidth, obHeight);
  obX -= 2;
}

void collide() { //check if the obstacles collides with T-Rex
  float Distance = dist(xPos, yPos, obX, obY); 
  if (Distance < mass+ obWidth) {
    screen = 0;
    text("GAME OVER", 100,100);
  }
}

//CODES FOR CONNECT TO ARDUINO 
void serialEvent(Serial myPort) {
  String s = myPort.readStringUntil('\n');
  s=trim(s);
  if (s!=null) {
    println(s);
    int values[]=int(split(s, ','));
    if (values.length==2) {
      //potentiometer is values[0] ; its value control xPos
      xPos = (int)map(values[0], 0, 1023, 0, width); 
      //LDR is value[1] ; its value affects yPos
      yPos = height - height/2 - values[1]*40;
    }
  }
  // print LED brightness value at console
  myPort.write(int(brightness)+","+int(brightness)+"\n");
}
