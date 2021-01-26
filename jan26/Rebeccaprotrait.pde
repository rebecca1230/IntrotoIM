/* This is my first homework for Intro to IM Assignment: Rebecca's self protrait 

This program was written by Rebecca Huang 
Due 25 January 2021 
*/

size(800, 800);

//face

fill(225);

//modified camalCase means the first letter of each word in a variable 
//is capitolized Except for the first word
int faceWidth =80;
int faceHeight=120;
ellipse(width/2, height/4, faceWidth, faceHeight);

//nose
int x1=420;
int x2=400;
int y1=205;
int y2=185;
int y3=215;
line(x1,y1,x2,y2);
line(x1,y1,x2,y3);

//mouth
arc(400, 220, 50, 50, 0, PI, CLOSE);

//hair
stroke(50, 102, 0);


//body
int bodyHeight = 170;
stroke(random(255), random(30, 100), 173);
rectMode(CENTER);
rect(width/2, height/2, faceWidth+ 30, bodyHeight);

//neck
rect(400, 287, 25, 54, 7);


//eyes
circle(385,170,18);
circle(415,170,18);
fill(color(50));
circle(385,172,8);
circle(415,172,8);

//arms
stroke(0,5,0);
fill(153);
rect(335, height/2, 20, 155, 7);
rect(465, height/2, 20, 155, 7);
circle(465,492,30);
circle(335,492,30);

//legs 
rect(378, 605, 42, 255, 7);
rect(423, 605, 42, 255, 7);
ellipse(width/1.8, height-52, 80, 30);
ellipse(width/2.2, height-52, 80, 30);
