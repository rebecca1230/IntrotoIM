void startGame () {
  background(blue);
  fill(255);
  textAlign(CENTER);
  PFont A = createFont("PatuaOne-Regular", 1);
  //display the phrase "Press blue button to start"
  textFont(A, fontsize/2);
  text("Press blue button to start", width/2, height/4+10);
  //display the text "Fighting COVID"
  textFont(A, fontsize+10);
  text("Fighting COVID", width/2, height/2);
  //display instrutions
  textFont(A, 24);
  text(" 3 Moderna shots and 3 Pfizer shtos to win \n [RED] 3 Moderna shots kill 1 B117 mutated virus \n [GREEN] 3 Pfizer shots kill 1 E484K mutated virus", width/2, height - height/4);
  //display a rectangle that incldes the phrase "Press blue button to start"
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  rect(width/2, height/4, 350, 70);
  if (blue1.equals(blue2) == true) { // if blue button pressed 
    gameStage = "PLAY";
  }
}

void winning() {
  background(red);
  fill(255);
  //display text about "COVID defeated!" and "Replay?"
  textAlign(CENTER);
  PFont Bfont = createFont("PatuaOne-Regular", 1);
  textFont(Bfont, 44);
  text("COVID defeated!\n Still need masks:)", width/2, height/4);
  text("Replay? \n Press yellow button", width/2, height/2);
  if (yellow1.equals(yellow2) == true) {//if yellow button pressed
    //play again
    gameStage = "PLAY";
    //reset the scores
    redShotCount = 0;
    greenShotCount = 0;
    redVirusHit = 0;
    greenVirusHit = 0;
  }
}

void restart() {
  //display the phrase "Replay?"
  background(blue);
  fill(255);
  textAlign(CENTER);
  PFont Bfont = createFont("PatuaOne-Regular", 1);
  textFont(Bfont, 44);
  text("Replay? \n Press yellow button", width/2, height/2);
  if (yellow1.equals(yellow2) == true) {//if yellow button pressed
    //play again
    gameStage = "PLAY";
    //reset the scores
    redShotCount = 0;
    greenShotCount = 0;
    redVirusHit = 0;
    greenVirusHit = 0;
  }
}
