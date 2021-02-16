/*
 This is my Week 4 Assignment for Intro to IM:
 Generative Text
 
 This program shows a sentence created from random noun, adjective, and verbs.
 
 This program was written by Rebecca Huang
 16 February 2021
 */

String adjective[]; 
String noun[]; 
String verb[]; 
//above are the arrays for loading csv files for adjective, noun, and verb lists
String adjectiveData [];
String nounData[];
String verbData[];
//above are the arrays for storing text's data
int index = 0; 
// listing the order of the words
int fontsize = 80;
int x = 30;
int y = 200;
color a =color(120,50,150);


void setup() {
  size(800, 600);
  frameRate(1);
  background(a);
}

void loadAdjective() { //function to load adjective csv files
  adjective = loadStrings("adjective.csv");
  adjectiveData = split(adjective[0], ","); // split the list of adjectives with ","
}

void loadNoun() { //function to load noun csv files
  noun = loadStrings("noun.csv");
  nounData = split(noun[0], ","); // split the list of nuons with ","
}

void loadVerb() { //function to load verb csv files
  verb = loadStrings("verb.csv");
  verbData = split(verb[0], ","); // split the list of verbs with ","
}

void display() {
  //String [] fontList = PFont.list();
  //printArray(fontList);
  PFont f = createFont("TsukuARdGothic-Bold", 32);
  textFont(f, fontsize);
  
  color adjectiveColor = color (255, 100, 0);
  fill(adjectiveColor); 
  text(adjective[index],x,y);
  
  color nounColor = color (0, 255, 100);
  fill(nounColor);
  text(noun[index],x,y+80);
 
  color verbColor = color (0, 100, 255);    
  fill(verbColor);
  text(verb[index],x,y+180);
}

void mouseClicked() {
  fill(color(a));
  background(a);
  index = index +1;
  display();
}

void draw() {
  loadAdjective();
  loadNoun();
  loadVerb();
  display();
}
