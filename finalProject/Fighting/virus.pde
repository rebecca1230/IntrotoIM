class Virus {
  float xV0 = 0;
  float xV1 = random(0, width);
  float xV2 = width;
  float yV0 = 0;
  float yV1 = random(0, height);
  float yV2 = height;

  //speed
  float xVspeed = 1;
  float yVspeed = 1;

  int virusDiameter = 20;

  float xV [] = {xV0, xV1, xV2};
  float yV [] = {yV0, yV1, yV2};
  int randX = (int)random(xV.length);
  int randY = (int)random(yV.length);

  void display() {

    color fourColors [] = {r, y, g, b};
    int theColor = (int)random(fourColors.length);
    fill(fourColors[theColor]);
    /*
    if (theVirus == 0 || theVirus == 1) {
      theColor = 0;
    }
    if (theVirus == 2 || theVirus == 3) {
      theColor = 1;
    }
    if (theVirus == 4 || theVirus == 5) {
      theColor = 2;
    }
    if (theVirus == 6 || theVirus == 7) {
      theColor = 3;
    }
    */
    circle(xV[randX], yV[randY], virusDiameter);
    update();
    edge();
  }

  void update() {
    xV[randX] += xVspeed;
    yV[randY] += yVspeed;
  }
  void edge() {
    if (xV[randX] < 0 || xV[randX] > width) {
      xVspeed *= -1;
    }
    if (yV[randY] < 0 || yV[randY] > height) {
      yVspeed *= -1;
    }
  }
}
