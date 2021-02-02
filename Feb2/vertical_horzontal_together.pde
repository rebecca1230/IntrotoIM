float yPos = 0.0;
float xPos = 0.0;

void setup() {
  size(800, 800);
  frameRate(50);
}
void draw() {
  background(255, 200, 0);
  xPos = xPos+1.0;
  yPos = yPos-1.0;
  while ((xPos > width)|(yPos < 0)) {
    xPos = 0;
    yPos = height;
  }
  stroke(255);
  rect(xPos, 0, xPos, height);
  rect(0, yPos, width, yPos);


  int i = 0;
  while (i < 650) {
    stroke(100, 0, 100);
    circle(i+5, i+5, 0.2*i);
    i = i + 3;
  }
}
