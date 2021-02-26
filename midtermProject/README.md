## Midterm Journal 

### What is the midterm project about? 
The midterm project is about creating a 2 players table hockey where the needed elements are: 
(1) strikers/mallets the players will use to hit (2) the puck(the name of the disk being pass back and forth between the players.
The players can choose four 3 types of tournaments, classified by the number of goals needed to win the game: (1) 7 goals; (2) 9 goals; (3) 11 goals.

### Feb 18(Thursday)
Spent a while researching on how to avoid Processing crash in the long term. 

### Feb 19(Friday)
Rather than dive into coding, I first spent some time on reviewing Lecture notes and scrutinizing codes of the art and games done with Processing, because I thought I should get myself more familiar with the Processing functions. Once I have a stronger foundation on familiarizing the overall program structure, I may avoid stuck on daunting debugging. 

### Feb 20(Saturday)
1. Reviewed the map function to see how that may allow me to create strikers.
2. Checked out the codes of some games created by others on https://openprocessing.org/curation/25/
3. Discovered the code for game *Catch the Flag* worth learning. 
**Inspiration**
Seeing how the *Catch the Flag* game did not have players use the mouse, I am inspired to have both players using keys to be fair for everyone. Player 1 will use the key "WSAE" as "up, down, left, right", whereas Player 2 will use the actual "up down left right" keys for playing.

### Feb 21(Sunday)
Went through tools that might be of use, such as:
   a) Basic functions such as arrray and for loop.
   b) kepPressed();

### Feb 22(Monday)
Created background for the table hockey game.
````
int fontsize = 80;

void setup() {
  size(800, 600);
  background(135);
  String [] fontList = PFont.list();
  printArray(fontList);

}

void draw() {
  //create left table
  noStroke();
  color leftTable = color(250, 30, 0);
  fill(leftTable);
  rect(0, 0, 400, 600);
  //create right table
  color rightTable = color(0, 30, 250);
  fill(rightTable);
  rect(400, 0, 400, 600);
  //design the hockey table
  fill(color(255));
  rect(395, 0, 8, height);
  fill(color(255));
  circle(width/2, height/2, 40);
}
````
![](background.png)

### Feb 23(Tuesday)
Figuring out how to create the start and restart game function, and the following are the incomplete codes:
````
void startgame() {
  boolean start= true;
  if (start == true)
  {
    game();
  }
  if (start == false);
  {
    background(0, 130, 130);
    PFont f = createFont("HanziPenSC-W3", 32);
    textFont(f, fontsize);
    text("Table Hockey", width/2,height/2);
  }
}

void game() {
  
}
````
*Outline to what the program needs:*

1. **Start_Page**: Continue and complete the "start game" page with choice of tornaments. 
2. **2_Strickers_and_1_Puck**: load photos of 2 strikers and one puck. 
3. **Move_the_Strikers**: allow the 2 players to move strikers with the keys. 
4. **Puck_Reacts**: The puck will bouce to the opposite direction one it touches the strikers. 
5. **Score**: Player gain one point when get the puck fully enter the opposite player's goal. [Use: for loop]
6. **Sound_and_Congrats**: When the player receive one point, create a sounds of celebration and print "Good Job" on the screen.
7. **After_Score**: The puck should be placed in the center on the side of the player who just lost a point to serve. 
8. **Line_of_Separation**: Create function that make the players unable to enter each other's zone. 
9. **Win_Lose_Restart**: Create the "Game Over" and "You win" page.

## 2/24(Wednesday)
1. Created a class for Strikers and another class for the puck. 
2. Included some functions in the classes that can do the following:
    1. Display the puck.
    2. Display the strikers.
    3. Create a move function that let the puck bounces back and forth in between the upper and lower edges.
    4. With the keyPressed() function, two players are able to move the strikers up and down with the keys WSEA, and arrow keys UP,DOWN,RIGHT,LEFT.

**Discoveries:** 
For the speed of the puck (xspeed, yspeed), if xspeed is larger than the yspeed, then the puck will slid off the screen, instead of having the chance to bounce up and down in between the screen. To sum up, the proportion of the speed of (x,y) is important. 

## 2/25(Thursday)
1. Continue working on the function of start and restart the game. 
2. Redesigned the background. 
3. Add function that displays the score counts. 
4. Add function that allows the game to end with a determined winner and loser. 
5. Add sound function that makes sound when the puck hits the edges and got hit by the strikers. 
6. Add sound function that makes sound when the player scores the goal and display the text "Good job!" on the screen.

**Discoveries:** 
Background(0); should be put under the draw() fuction, or else, rather than create a puck for bouncing back and forth, we will create multiple pucks overlapping each other.

**What works and what does not work?**
The part about the midterm project that I spent the most time working on is: creating the left and right strikers. Because left and right strikers encompass different functionality, when including them under the same class of "Strikers", I need to look out for the possible contradictions among the functions and design the program more sophistically.

First, I used boolean to determine the left and right strikers:
````
  Strikers(boolean left) { //use boolean 
  //and the following if statement to determined the left or right striker.
    if (left) {
      x = j;
    } else {
      x = width - j;      
    }
  }
````
Soon, I encounter some difficulties. I need to create a function that limits the movement of the strikers for each only has half of the screen, but I was not sure about how to approach the dilemma. Then, I added the following function under the Strikers(boolean left){} function: 
````
    if (x>width/2) {
      x= x-(width/2)-(j/2);
    }
````
Unfortunately, nothing changed. Later on, I separated two paddles' range for x value with the following code: 
````
  void moveLeftX(float steps) {
    x += steps;
    x = constrain(x, j/2, width/2);
  }  

  void moveRightX(float steps) {
    x += steps;
    x = constrain(x, width/2, width-j/2);
  }  
  ````
  And it works! 

## 2/26(Friday)
**Gaol for the day:** At this point, we have two paddles that the players can control. However, we still need:
1. Allow the paddles to move at the same time. 
2. The puck bouce off as soon as a paddle touches it. 
3. Score and count the scores.

***For Goal 2*** I tried out the following codes:
````
  void checkPaddleLeft (Paddles p) {
    if (x == p.x) {
      xspeed *= -1;
    }
    if (y == p.y) {
      yspeed *= -1;
    }
  }

  void checkPaddleRight (Paddles p) {
    if (x == p.x) {
      xspeed *= -1;
    }
    if (y == p.y) {
      yspeed *= -1;
    }
  }
  ````
However, that was not effective, so I try to discover some solutions by checking the code of "Multiple object collision" from here: https://processing.org/examples/bouncybubbles.html. Unfortunately, that was not helpful. 

***For Goal 3***
Frustrated about unable to achieve Goal 2, I decided to first work on Goal 3: create the score function. The tricky part is to let the score happen only when the puck is at a specific "y" range, and the folliwng code that I first tried did not work:
````
  void edges() {
    if (y<0 || y>height) {
      yspeed *= -1;
    }
    if (x<0 || x>width) {
      xspeed *= -1;
    }
  }
  void checkScore() {
    if (y < height-220 && y > height-180) {
      reset();
      score();
    }
  }
  void score() {
    leftscore++;
    rightscore++;
  }
  ````
  After trying out different methods, the following code finally works! : 
  ````
    void edges() {
    if (y < 0 || y > height) {
      yspeed *= -1;
    }
    if (x < 0 || x > width) {
      xspeed *= -1;
    }
    if (x < 0 && y > height-340 && y < height-260 == true) {
      rightscore++;
      reset();
    }
   if (x > width && y > height-340 && y < height-260 == true) {
      leftscore++;
      reset();
    }
  }
  ````
  
