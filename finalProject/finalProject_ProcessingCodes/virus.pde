//distance between cell diameter and falling object diameter
float min = fallDiameter + cellDiameter; 

class redShot {
  boolean touch = false;
  //define red shot initial xPos, yPos, and speed
  float x = random(0, width);
  float y;
  float ySpeed = random(1, 2);
  //display red shot
  void display() {
    imageMode(CENTER);
    image(redShot, x, y, fallDiameter+10, fallDiameter+10);
    update();
    hit();
  }
  void update() {
    y += ySpeed;
    if (y > height) {//if object off screen
      touch = false;
      x = random(0, width);
      y = -fallDiameter;//fall from above
    }
  }
  void hit() {//detect cell and object collide
    float xDist = abs(x - xC);
    float yDist = abs(y - yC);
    float diff = fallDiameter / 2 + cellDiameter / 2;
    if (xDist <= diff && yDist <= diff && !touch) {
      touch = true;
      redShotCount++;
    }
  }
}

class greenShot {
  boolean touch = false;
  //define green shot initial xPos, yPos, and speed
  float x = random(0, width);
  float y;
  float ySpeed = random(1, 2);
  //display green shot
  void display() {
    imageMode(CENTER);
    image(greenShot, x, y, fallDiameter+10, fallDiameter+10);
    update();
    hit();
  }
  void update() {
    y += ySpeed;
    if (y > height) {//if object off screen
      touch = false;
      x = random(0, width);
      y = -fallDiameter;//fall from above
    }
  }
  void hit() {//detect cell and obejct collide
    float xDist = abs(x - xC);
    float yDist = abs(y - yC);
    float diff = fallDiameter / 2 + cellDiameter / 2;
    if (xDist <= diff && yDist <= diff && !touch) {
      touch = true;
      greenShotCount++;
    }
  }
}

class redVirus {
  boolean touch = false;
  //define red virus initial xPos, yPos, and speed
  float x = random(0, width);
  float y;
  float ySpeed = random(1, 2);
  //display red virus
  void display() {
    imageMode(CENTER);
    image(redVirus, x, y, fallDiameter-5, fallDiameter-5);
    //circle(x, y, virusDiameter);
    update();
    hit();
    buttonPressed();
  }
  void update() {
    y += ySpeed;
    if (y > height) {//if object off screen
      touch = false;
      x = random(0, width);
      y = -fallDiameter;//fall from above
    }
  }
  void hit() {//detect cell and object collide
    float xDist = abs(x - xC);
    float yDist = abs(y - yC);
    float diff = fallDiameter / 2 + cellDiameter / 2;
    if (xDist <= diff && yDist <= diff && !touch) {
      touch = true;
      redVirusHit++;
    }
  }
  void buttonPressed() {
    if (red1.equals(red2) == true) {//if red button pressed
      x--;//red virus move left one step
    }
  }
}
class greenVirus {
  //  boolean stop = false;
  boolean touch = false;
  //define green virus initial xPos, yPos, and speed
  float x = random(0, width);
  float y;
  float ySpeed = random(1, 2);
  //display green virus
  void display() {
    imageMode(CENTER);
    image(greenVirus, x, y, fallDiameter, fallDiameter);
    update();
    hit();
    buttonPressed();
  }
  void update() {
    y += ySpeed;
    if (y > height) {//if object off screen
      touch = false;
      x = random(0, width);
      y = -fallDiameter;//fall from above
    }
  }
  void hit() {//detect cell and object collide
    float xDist = abs(x - xC);
    float yDist = abs(y - yC);
    float diff = fallDiameter / 2 + cellDiameter / 2;
    if (xDist <= diff && yDist <= diff && !touch) {
      touch = true;
      greenVirusHit++;
    }
  }
  void buttonPressed() {
    if (green1.equals(green2) == true) {//if green button pressed
      x --;//green virus move left one step
    }                
  }
}
