class Paddle {
  float xPad; //paddle's x position
  float yPad; //paddle's y position
  float wPad = paddlesDiameter; //paddle's width
  float hPad = paddlesDiameter; //paddle's height
  float xPadSpeed = 0; //paddle's speed
  float yPadSpeed = 0; //paddle's speed
  float speedWSAE = 7; //speed of keyPressed

  void setup() {
    /*
     though this is left paddle's setting,
     can still apply this to the right paddle after specify
     right.setup(); under the main tab's setup function
     */
    //paddle's initial x & y location
    xPad = width/4; 
    yPad = height/2; 
    //paddle's range limit
    xPad = constrain(xPad, wPad/2, width/2);
    yPad = constrain(yPad, hPad/2, height-hPad/2);
  }

  void draw() {
    //add speed to paddle
    xPad += xPadSpeed;
    yPad += yPadSpeed;
    //display paddle
    imageMode(CENTER);
    image(bluepaddle, xPad, yPad, paddlesDiameter, paddlesDiameter); //draw paddle
  }
  void collision(Puck puck) { //function that checks puck and paddles colliding
    float D = dist(xPad, yPad,
      puck.xPuk, puck.yPuk); //D is the distance between paddle and puck
    if (D < mindistance) //if D is smaller than mindistance
    {
      float dx = xPad-puck.xPuk; //dx is the distance bewteen paddle's x & puck's x
      float dy = yPad-puck.yPuk; //dy is the distance between paddle's y & puck's y
      puck.xSpeed = -dx*0.25; //puck's x speed changes
      puck.ySpeed = -dy*0.25; //puck's y speed changes
      hockey.play();
    }
  }
}
