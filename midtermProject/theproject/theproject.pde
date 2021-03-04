/*
 Intro to IM
 Midterm Project: Air Hockey
 Rebecca Huang
 Due date: March 4, 2021
 */

//import the SoundFiles
import processing.sound.*;
SoundFile hockey;
SoundFile score;
SoundFile congratulations;
SoundFile kidding;
PImage bluepaddle;

//define the objects under class Paddle and class Puck
Puck puck;
Paddle left;
Paddle right;
//define some variables
int leftscore = 0;
int rightscore = 0;

float puckDiameter = 25;
float puckRadius = puckDiameter/2;
float paddlesDiameter = 60;
float paddlesRadius = paddlesDiameter/2;
float mindistance = puckRadius+paddlesRadius;

float tableline = 0;
int fontsize = 60;
String gameStage;

void setup() {
  gameStage = "START";

  hockey = new SoundFile(this, "hockey.mp3");
  score = new SoundFile(this, "score.mp3");
  congratulations = new SoundFile(this, "congratulations.mp3");
  kidding = new SoundFile(this, "kidding.mp3");
  bluepaddle = loadImage("bluepaddle.png");

  //determine hockey table size
  size(800, 400);
  //left paddle's set up
  left = new Paddle();
  left.setup();
  left.xPad=width/4; //determine left paddle's initial x position
  left.yPad=height/2; //determine right paddle's initial y position
  //right paddle's setup
  right = new Paddle();
  right.setup();
  right.xPad=600; //determine right paddle's initial x position
  right.yPad=height/2; //determine right paddle's initial y position
  //puck's setup
  puck = new Puck();
  puck.setup();
  //  String[] fontList = PFont.list();
  //  printArray(fontList);
}

void draw() { //determine the 3 main game stages: START, PLAY, and RESTART.
  if (gameStage == "START") {
    if (kidding.isPlaying() == false) {
      kidding.play();
    }
    startGame();
  } else if (gameStage == "PLAY") {
    kidding.stop();
    playGame();
  } else if (gameStage == "LEFTWIN") {
    leftWin();
  } else if (gameStage == "RIGHTWIN") {
    rightWin();
  } else if (gameStage == "RESTART") {
    restart();
  }
}

void startGame() {
  //display background
  background(0, 100, 80);
  fill(255);
  textAlign(CENTER);
  PFont A = createFont("HiraginoSans-W1", 1);
  //display the word start
  textFont(A, fontsize/2);
  text("Start", width/2, height/4+10);
  //display the text "Air Hockey"
  textFont(A, fontsize+10);
  text("Air Hockey", width/2, 250);
  //display instrutions
  textFont(A, 24);
  text("Left player uses WSAE & Right player uses arrow keys", width/2, 350);
  //display a rectangle that incldes the word "Start"
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  rect(width/2, height/4, 100, 70);
  //if mousePressed the rectangle including the word "Start"
  if (mouseX > width/2-50 && mouseX < width/2+50
    && mouseY > height/4-40 && mouseY < height/4+40
    && mousePressed) {
    //gameStage changes to "PLAY"
    gameStage = "PLAY";
  }
}

void playGame() {
  background(150, 100, 170);

  //draw the line in the middle of the table
  for (tableline = 0; tableline < height; tableline = tableline + 20)
  {
    fill(255, 200, 200);
    rect(width/2 -1.5, -1 + tableline, 3, 10);
  }

  left.draw();
  right.draw();
  left.collision(puck);
  right.collision(puck);
  //limit left and right paddles' ranges
  left.xPad = constrain(left.xPad, left.wPad/2, width/2);
  right.xPad = constrain(right.xPad, width/2, width-right.wPad/2);
  left.yPad = constrain(left.yPad, left.hPad/2, height-left.hPad/2);
  right.yPad = constrain(right.yPad, right.hPad/2, height-right.hPad/2);

  puck.draw();
  puck.checkWin();

  //display scores
  fill(0);
  textSize(36);
  text(leftscore, 90, 50);
  text(rightscore, width-100, 50);
}

void leftWin() { //when left player wins, display text of congratulations. 
  background(0, 100, 80);
  fill(255);
  textAlign(CENTER);
  PFont B = createFont("HiraginoSans-W1", 1);
  textFont(B, 44);
  text("Congratulations to the winner:\nthe LEFT player!!!\nGood Game:)", width/2, height/2);
  gameStage = "RESTART";
}

void rightWin() { //when right player wins, display text of congratulations.
  background(0, 100, 80);
  fill(255);
  textAlign(CENTER);
  PFont B = createFont("HiraginoSans-W1", 1);
  textFont(B, 44);
  text("Congratulations to the winner:\nthe RIGHT player!!!\nGood Game:)", width/2, height/2);
  gameStage = "RESTART";
}

void restart() {
  //display the phrase "Play Again"
  PFont B = createFont("HiraginoSans-W1", 1);
  textFont(B, fontsize/2-5);
  text("Play Again", width/2, height/4+5);
  //display a rectangle that incldes the phrase "Play Again"
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  rect(width/2, height/4, 195, 70);
  //if mousePressed the rectangle
  if (mouseX > width/2-50 && mouseX < width/2+50
    && mouseY > height/4-40 && mouseY < height/4+40
    && mousePressed) {
    //play again
    gameStage = "PLAY";
    //reset the scores
    leftscore = 0;
    rightscore = 0;
    //put puck back to the center
    puck.xPuk = width/2;
    puck.yPuk = height/2;
    //reset paddles' locations
    left.xPad = width/4;
    left.yPad = height/2;
    right.xPad = 600;
    right.yPad = height/2;
    //stop music of congratulations
    congratulations.stop();
  }
}
