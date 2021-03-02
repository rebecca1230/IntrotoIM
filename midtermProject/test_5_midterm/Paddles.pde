class Paddles {
  //positions of the strikers at the beginning.
  float x;
  float y=height/2;
  float j=paddlesDiameter;
  float k=paddlesDiameter;
  color player = color(0, 100, 255);

  Paddles(boolean left) { //use boolean
    //and the following if statement to determine the left or right striker.
    if (left) {
      x = j;
    } else {
      x = width - j;
    }
  }

void restart() {
  left.x = j;
  left.y = height/2;
  right.x = width - j;
  right.y = height/2;
}

  void display() {
    fill(player);
    strokeWeight(4);
    ellipseMode(CENTER);
    ellipse(x, y, j, k);
  }

  void moveLeftX(float steps) {
    x += steps;
    x = constrain(x, j/2, width/2);
  }

  void moveRightX(float steps) {
    x += steps;
    x = constrain(x, width/2, width-j/2);
  }

  void moveY(float steps) {
    y += steps;
    y = constrain(y, k/2, height-k/2);
  }


}


 
