class Puck {
  float xPuk; //puck's x value
  float yPuk; //puck's y value
  float xSpeed = 2; //puck's x speed
  float ySpeed = 3; //puck's y speed

  void setup() {
    xPuk = width/2; //puck's inital x position
    yPuk = height/2; //puck's initial y position
  }

  void draw() {

    //display puck
    strokeWeight(0);
    fill(250, 250, 0); //puck's color
    circle(xPuk, yPuk, puckDiameter); //draw puck
    //display goals
    fill(255); //make goals green
    rectMode(CENTER);
    rect(0, height/2, 20, 100, 8); //draw left goal
    rect(width, height/2, 20, 100, 8); //draw right goal

    //add speed to puck
    xPuk += xSpeed;
    yPuk += ySpeed;

    //check edges
    if (yPuk < 2 || yPuk > height-2) { //if puck hits floor or hits ceiling
      ySpeed *= -1; //reverse puck's y speed
      hockey.play(); //play the sound of puck collides
    }
    if (xPuk < 2 || xPuk > width-2) { //if puck hits left or hits right wall
      xSpeed *= -1; //reverse puck's x speed
      hockey.play(); //play the sound of puck collides
    }
    //score the goals
    if (xPuk < 8 && yPuk > height-250
      && yPuk < height-150 && rightscore <= 4 == true) { //if puck enters left's goal
      rightscore++; //right player score 1 point
      xPuk = width/2-50;
      yPuk = height/2;
      xSpeed = 0;
      ySpeed = 0;
      score.play(); //play the sound of scoring
    }
    if (xPuk > width-8 && yPuk > height-250
      && yPuk < height-150 && leftscore <= 4 == true ) { //if puck enters right's goal
      leftscore++; //left player score 1 point
      xPuk = width/2+50;
      yPuk = height/2;
      xSpeed = 0;
      ySpeed = 0;
      score.play(); //play the sound of scoring
    }
  }

  void checkWin() {
    if (leftscore > 4) { //if left player score a 3
      gameStage = "LEFTWIN"; //left player wins and change gameStage
      congratulations.play(); //play music_congratulations
      congratulations.loop(); //replay music_congratulations if it ends
    } else if (rightscore > 4) { //if right player score a 3
      gameStage = "RIGHTWIN"; //right player wins and change gameStage
      congratulations.play(); //play music_congratulations
      congratulations.loop(); //replay music_congratulations if it ends
    }
  }
}
