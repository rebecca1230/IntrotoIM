import processing.sound.*;

SoundFile hockey;
SoundFile score;
SoundFile congratulations;
SoundFile kidding;

Puck puck;
Paddles left;
Paddles right;
int leftscore = 0;
int rightscore = 0;
float puckDiameter = 25;
float puckRadius = puckDiameter/2;
float paddlesDiameter = 60;
float paddlesRadius = paddlesDiameter/2;
float distance = puckRadius+paddlesRadius;
int fontsize = 80;
String gameStage;
//location,velocity, and acceleration for puck's (x,y)
PVector location;
PVector velocity;
PVector acceleration;

void setup() {
  gameStage = "START";
  size(800, 500);
  hockey = new SoundFile(this, "Desktop/hockey.mp3");
  score = new SoundFile(this, "Desktop/score.mp3");
  congratulations = new SoundFile(this, "Desktop/congratulations.mp3");
  kidding = new SoundFile(this, "Desktop/kidding.mp3");
  puck = new Puck();
  left = new Paddles(true);
  right = new Paddles(false);
  String[] fontList = PFont.list();
  printArray(fontList);
}

void draw() {
  if (gameStage == "START") {
    startGame();
  } else if (gameStage == "PLAY") {
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
  //display a black background screen
  background(0);
  //display the text "Table Hockey"
  fill(255);
  textAlign(CENTER);
  textSize(60);
  PFont A = createFont("OpenSans", 600);
  textFont(A, fontsize);
  text("Table Hockey", width/2, height/2);
  //display the word start
  PFont B = createFont("Zapfino", 1);
  textFont(B, fontsize/5);
  text("Start", width/2, height/4);
  //display a rectangle that incldes the word Start
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  rect(width/2, height/4, 100, 80);
  if (mouseX > width/2-50 && mouseX < width/2+50
    && mouseY > height/4-40 && mouseY < height/4+40
    && mousePressed) {
    gameStage = "PLAY";
  } 
}

void playGame() {
  background(100, 130, 130);
  //Puck's functions
  puck.display();
  puck.update();
  puck.edges();
  puck.collide(left.x, left.y, right.x, right.y);
  left.display();
  right.display();
  //display scores
  fill(0);
  textSize(36);
  text(leftscore, 90, 50);
  text(rightscore, width-100, 50);
  puck.checkWin();
}

void leftWin() {
  background(0);
  fill(255);
  textAlign(CENTER);
  PFont A = createFont("OpenSans", 600);
  textFont(A, fontsize/2);
  text("Congratulation to the winner:\nthe LEFT player!!!\nGood Game:)", width/2, height/2);
  gameStage = "RESTART";
}

void rightWin() {
  background(0);
  fill(255);
  textAlign(CENTER);
  PFont A = createFont("OpenSans", 600);
  textFont(A, fontsize/2);
  text("Congratulation to the winner:\nthe RIGHT player!!!\nGood Game:)", width/2, height/2);
  gameStage = "RESTART";
}

void restart() {
  //display the word "Play Again"
  PFont B = createFont("Zapfino", 1);
  textFont(B, fontsize/5);
  text("Play Again", width/2, height/4);
  //display a rectangle that incldes the phrase Play Again
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  rect(width/2, height/4, 200, 80);
  if (mouseX > width/2-50 && mouseX < width/2+50
    && mouseY > height/4-40 && mouseY < height/4+40
    && mousePressed) {
    gameStage = "PLAY";
    leftscore = 0;
    rightscore = 0;
    left.restart();
    right.restart();
    congratulations.stop();
  }
}

void keyPressed () {
  if (key == 'w' || key == 'W') {
    left.moveY(-30.5);
  }
  if (key == 's' || key == 'S') {
    left.moveY(30.5);
  }
  if (key == 'e' || key == 'E') {
    left.moveLeftX(30.5);
  }
  if (key == 'a' || key == 'A') {
    left.moveLeftX(-30.5);
  }
  if (key == CODED) {
    if (keyCode == UP) {
      right.moveY(-30.5);
    }
    if (keyCode == DOWN) {
      right.moveY(30.5);
    }
    if (keyCode == RIGHT) {
      right.moveRightX(30.5);
    }
    if (keyCode == LEFT) {
      right.moveRightX(-30.5);
    }
  }
}
