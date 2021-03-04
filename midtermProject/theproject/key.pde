void keyPressed() { //move paddles UP, DOWN, LEFT, RIGHT with WSAE & arrow keys

//Left player uses "wsae" or "WSAE"
  if (key == 'w' || key == 'W') {
    left.yPadSpeed = -left.speedWSAE;
  }
  if (key == 's' || key == 'S') {
    left.yPadSpeed = left.speedWSAE;
  }
  if (key == 'a' || key == 'A') {
    left.xPadSpeed = -left.speedWSAE;
  }
  if (key == 'e' || key == 'E') {
    left.xPadSpeed = left.speedWSAE;
  }
//right player uses arrow kwys UP,DOWN,LEFT,RIGHT
  if (key == CODED) {
    if (keyCode == UP) {
      right.yPadSpeed = -right.speedWSAE ;
    }
    if (keyCode == DOWN) {
      right.yPadSpeed = right.speedWSAE ;
    }
    if (keyCode == LEFT) {
      right.xPadSpeed = -right.speedWSAE ;
    }
    if (keyCode == RIGHT) {
      right.xPadSpeed = right.speedWSAE ;
    }
  }
}

void keyReleased() { //allowing left and right paddles to move at the same time
  if (key == 'w' || key == 'W' || key == 's' || key == 'S')
  {
    left.yPadSpeed = 0;
  }

  if (key == 'a' || key == 'A' || key == 'e' || key == 'E')
  {
    left.xPadSpeed = 0;
  }

  if (key==CODED)
  {
    if (keyCode==UP || keyCode==DOWN)
    {
      right.yPadSpeed = 0;
    }

    if (keyCode==LEFT || keyCode==RIGHT)
    {
      right.xPadSpeed = 0;
    }
  }
}
