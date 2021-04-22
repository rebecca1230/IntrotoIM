class Arrow {
  float xA;
  float yA;
  float xAspeed = 1;
  float yAspeed = 2;

  void setup() {
    xA = width/4;
    yA = height/4;
  }
  void draw() {
    xA += xAspeed;
    yA += yAspeed;
    rectMode(CENTER);
    rect(xA, yA, 40, 10);
    if (keyPressed) {
      xAspeed -= 1;
      yAspeed -= 1;
    }
  }
  void disappear() {
  }
}
