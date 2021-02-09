class People {
  //defining variables
  float x, y, w, h;
  float speedX, speedY;
  color c;

  //constructor
  People() {
    x = random(100, width-100);
    y =random(100, height-100);
    w=random(20, 60);
    h=w;
    c=color(random(255), 0, random(255));
    speedX =( 2);
    speedY =( 2);
  }

  //what the peopl do
  void update() {
    shaking();
    x += speedX;
    y += speedY;
  }
  void display() {
    fill(c);
    ellipse(x, y, w, h);
  }

  void shaking() { //let the people run back
    if (x < 0+width/4 || x> width-50) {
      speedX *= -1;
    }
    if ( y <0+height/2 || y> height/2) {
      speedY *= -1;
    }
  }
}

People b;

People[] students;

void setup() {
  size(800, 800);
  stroke(20);
  strokeWeight(4);
  b = new People();
  students = new People[100];
  for (int i=0; i<students.length; i++) {
    students[i] = new People();
  }
}

void draw() {
  clearBackground();
  b.update();
  b.display();
  for (int i =0; i<students.length; i++) {
    students[i].update();
    students[i].display();
  }
}

void clearBackground() {
  fill(255);
  rect(0, 0, width, height);
}
