
class Puck {

  Puck() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(2, 3);
    acceleration = new PVector(0.005, 0);
  }

  void display() {
    strokeWeight(0);
    fill(255);
    circle(location.x, location.y, puckDiameter);
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(0, height/2, 20, 200, 8);
    rect(width, height/2, 20, 200, 8);
  }

  void update() {
    location.add(velocity);
    velocity.add(acceleration);
  }

  void reset() {
    location.x = width/2;
    location.y = height/2;
  }

  void edges() {
    if (location.y < 0 || location.y > height) {
      velocity.y *= -1;
      hockey.play();
    }
    if (location.x < 0 || location.x > width) {
      velocity.x *= -1;
      hockey.play();
    }
    if (location.x < 8 && location.y > height-395 
    && location.y < height-205 && rightscore <= 2 == true) {
      rightscore++;
      reset();
      score.play();
    }
    if (location.x > width-8 && location.y > height-395 
    && location.y < height-205 && leftscore <= 2 == true ) {
      leftscore++;
      reset();
      score.play();
    }
  }

  void checkWin() {
    if (leftscore > 2) {
      gameStage = "LEFTWIN";
      congratulations.play();
      congratulations.loop();
    } else if (rightscore > 2) {
      gameStage = "RIGHTWIN";
      congratulations.play();  
      congratulations.loop();
    }
  }

  void collide(float leftX, float leftY, float rightX, float rightY) {
    boolean leftbounce = false;
    boolean rightbounce = false;
    if (dist(leftX, leftY, location.x, location.y) < distance) {
      leftbounce = true;
    }
    if (dist(rightX, rightY, location.x, location.y) < distance) {
      rightbounce = true;
    }
    if (leftbounce) {
      velocity.x *= -1;
      velocity.y *= -1;
      hockey.play();
      /*
      float ldx = left.x - location.x;
      float ldy = left.y - location.y;
      velocity.x *= -ldx*0.2;
      velocity.y *= -ldy*0.2;
      */
    }
    if (rightbounce) {
      velocity.x *= -1;
      velocity.y *= -1;
      hockey.play();
      /*
      float rdx = right.x - location.x;
      float rdy = right.y - location.y;
      velocity.x *= -rdx*0.2;
      velocity.y *= -rdy*0.2;
      */
    }
  }
}
