int xC;
int yC;
int cellDiameter = 100;

class Cell {
  void setup() {
    xC = width/2;
    yC = height/2;
  }
  void draw() {
    color(100, 100, 100);
    ellipse(xC, yC, cellDiameter, cellDiameter);
  }
  void shrink() {
  }
}
