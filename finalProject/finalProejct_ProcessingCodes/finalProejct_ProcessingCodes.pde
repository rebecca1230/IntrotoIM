/*
  Intro to IM 
  Final Project: Fighting COVID
  Creator: Rebecca Huang
  Due Date: April 29, 2021
*/

//Codes for ARDUINO
import processing.serial.*;
Serial myPort;

//Strings for detect if button is on
String blue1;
String blue2 = "blueOn";
String yellow1;
String yellow2 = "yellowOn";
String red1;
String red2 = "redOn";
String green1;
String green2 = "greenOn";

//Import shots, cell, and virus images
PImage redShot;
PImage greenShot;
PImage redVirus;
PImage greenVirus;
PImage cell;

//determine the value of catching shot and virus
int redShotCount;
int greenShotCount;
int redVirusHit;
int greenVirusHit;

int xC;//Cell's xPos
int yC;//Cell's yPos
int cellDiameter = 50;//Cell's diameter
int fallDiameter = 80;//falling objects diameter

//determine the colors
color red = color(255, 100, 100);
color yellow = color(255, 255, 155);
color green = color(100, 200, 100);
color blue = color(100, 130, 230);

//RED and GREEN vaccine array
redShot [] redSs = new redShot[2];
greenShot [] greenSs = new greenShot[2];
//RED and Green virus array
redVirus [] redVs = new redVirus[3];
greenVirus [] greenVs = new greenVirus[3];

int fontsize = 60;
String gameStage;

void setup() {
  gameStage = "START";

  size(600, 700);
  //define cell's x and y initial values
  xC = width/2;
  yC = height - (height/7);
  //load images
  redShot = loadImage("redShot.png");
  greenShot = loadImage("greenShot.png");
  redVirus = loadImage("redVirus.png");
  greenVirus = loadImage("greenVirus.png");
  cell = loadImage("cell.png");

  initializeArray();

  //Choose ARDUINO port
  printArray(Serial.list());
  String portname=Serial.list()[7];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

//determine the 4 main game stages: START, PLAY, WON, and RESTART.
void draw() { 
  if (gameStage == "START") {
    startGame();
  } else if (gameStage == "PLAY") {
    playGame();
  } else if (gameStage == "WON") {
    winning();
  } else if (gameStage == "RESTART") {
    initializeArray();
    restart();
  }
}

//call shot and virus array
void initializeArray() {
  for (int i = 0; i < redSs.length; i++) {
    redSs[i] = new redShot();
  }
  for (int i = 0; i < greenSs.length; i++) {
    greenSs[i] = new greenShot();
  }
  for (int i = 0; i < redVs.length; i++) {
    redVs[i] = new redVirus();
  }
  for (int i = 0; i < greenVs.length; i++) {
    greenVs[i] = new greenVirus();
  }
}

void playGame() {
  background(yellow);

  //display sores
  textSize(24);
  //display RED shot and RED virus on same side
  fill(red);
  text("Moderna Shot", 100, 30);
  text(redShotCount, 200, 30);
  text("B.1.1.7 Variant", 100, 70);
  text( redVirusHit, 200, 70);
  //display GREEN shot and GREEN virus on same side
  fill(green);
  text("Pfizer Shot", width-130, 30);
  text(greenShotCount, width-30, 30);
  text("E484K Variant", width-150, 70);
  text(greenVirusHit, width-30, 70);
  
  //add display function to all shot and virus
  for (int i = 0; i < redSs.length; i++) {
    redSs[i].display();
  }
  for (int i = 0; i < greenSs.length; i++) {
    greenSs[i].display();
  }
  for (int i = 0; i < redVs.length; i++) {
    redVs[i].display();
  }
  for (int i = 0; i < greenVs.length; i++) {
    greenVs[i].display();
  }
  
  //draw black line at the bottom of the screen
  color(255, 255, 255);
  fill(0);
  rectMode(CENTER);
  rect(0, height - (height/7) + cellDiameter /2, width*2, 5);
  //draw cell
  image(cell, xC, yC, cellDiameter*2, cellDiameter*2);
  checkWin();
}

void checkWin() {
  //3 greenshots fight off 1 green virus
  if (greenShotCount > 2 && greenVirusHit > 0) {
    greenShotCount -= 3;
    greenVirusHit -= 1;
  }
  //lose when hit by 1 green virus when not yet obtain 3 green shots
  if (greenShotCount < 3 && greenVirusHit > 0) {
    gameStage = "RESTART";
  }
  //3 redshots fight off 1 red virus
  if (redShotCount > 2 && redVirusHit > 0) {
    redShotCount -= 3;
    redVirusHit -= 1;
  }
  //lose when hit by 1 red virus when not yet obtain 3 red shots
  if (redShotCount < 3 && redVirusHit > 0) {
    gameStage = "RESTART";
  }
  //win when obtain 3 red and 3 green shots
  if (greenShotCount > 2 && redShotCount > 2) {
    gameStage = "WON";
  }
}

void serialEvent(Serial myPort) {//have ARDUINO message print at Processing console
  String infoFromA = trim(myPort.readStringUntil('\n'));
  if (infoFromA != null) {
    println(infoFromA);
    String values[]=split(infoFromA, ',');
    if (values.length == 5) {
      //use potentiometer value to control xC
      xC = (int)map(int(values[0]), 0, 1023, width-cellDiameter, 0);
      //assign button on off strings
      blue1 = values[1];
      yellow1 = values[2];
      red1 = values[3];
      green1 = values[4];
    }
    //myPort.write(int()+","+int()+"\n");
  }
}
