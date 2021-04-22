color r = color(255, 100, 100);
color y = color(255, 255, 155);
color g = color(100, 200, 100);
color b = color(100, 155, 255);

int theVirus;

Cell cell;
// PImage redArrow;
// PImage yellowArrow;
// PImage greenArrow;
// PImage blueArrow;

Arrow []arrows = new Arrow[2];
Virus []vmany = new Virus[8];

void setup() {
  size(800, 600);
  arrows[0] = new Arrow();
  arrows[1] = new Arrow();
  
  for (int theVirus = 0; theVirus < vmany.length; theVirus++) {
    vmany[theVirus] = new Virus();
  }

  cell = new Cell();
  // redArrow = loadImage("redArrow.png");
  // yellowArrow = loadImage("yellowArrow.png");
  // greenArrow = loadImage("greenArrow.png");
  // blueArrow = loadImage("blueArrow.png");
}

void draw() {
  background(255);
  arrows[0].setup();
  arrows[0].draw();
  arrows[0].disappear();

  arrows[1].setup();
  arrows[1].draw();
  arrows[1].disappear();

  cell.setup();
  cell.draw();
  cell.shrink();

  for (int theVirus = 0; theVirus < vmany.length; theVirus++) {
    vmany[theVirus].display();
  }
}
