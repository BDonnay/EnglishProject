int rad = 40;        // Width of the shape
float xpos, ypos;    // Starting position of shape
int TS1 = 0;
int TS2 = 0;

float xspeed = 5;  // Speed of the shape
float yspeed = 5;  // Speed of the shape
PFont f;
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
float blockerX = 10;
float blockerY = 10;
float blockerW = 10;
float blockerH = 60;
float blockerX2 = 10;
float blockerY2 = 10;
float blockerW2 = 10;
float blockerH2 = 60;

boolean keyz[] = new boolean [4];

void keyPressed() {
  if (keyCode == UP) keyz[0] = true;
  if (keyCode == DOWN) keyz[1] = true;
  if (keyCode == SHIFT) keyz[2] = true;
  if (keyCode == CONTROL) keyz[3] = true;}
  
void keyReleased() {
  if (keyCode == UP) keyz[0] = false;
  if (keyCode == DOWN) keyz[1] = false;
  if (keyCode == SHIFT) keyz[2] = false;
  if (keyCode == CONTROL) keyz[3] = false;}


void setup() 
{
  size(1000, 500);
  fill(233,20,31);
  noStroke();
  frameRate(30);
  ellipseMode(CENTER);
  xpos = width/2;
  ypos = height/2;
  frameRate(60);
  blockerX = width - 40;
  blockerX2 = 30;
  
}

void draw() 
{
  background(255);
  fill(210,35,29);
  ellipse(0,250,171,171);//oppgoalcir
  ellipse(1000,250,171,171);//wildgoalcir
  ellipse(500,250,171,171);//centercircle
  fill(255);
  ellipse(0,250,161,161);//oppgoalcirlcefill
  ellipse(1000,250,161,161);//wildgoalcirclefill
  ellipse(500,250,161,161);//centerwhite
  fill(210,35,29);
  ellipse(500,250,30,30);//centerdot
  rect(495,0,10,500);
  fill(233,70,228);
  rect(0, 170, 4, 160);//goal opp
  fill(22,133,32);
  rect(996, 170, 4, 160);//goal wild
  fill(22,133,32);
  rect(blockerX, blockerY, blockerW, blockerH);
  fill(233, 70, 228);
  rect(blockerX2, blockerY2, blockerW2, blockerH2);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  if (xpos > width || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height || ypos < 0) {
    ydirection *= -1;
  }
  if (xpos == 20 &&(ypos > 170 && ypos < 330)){
      TS1++;
  }
  if (xpos == 980 && (ypos > 170 && ypos < 330)){
      TS2++;
  }
  if (xpos == 40 && (ypos >= blockerY2 -10 && ypos <= blockerY2 + 70)){
    xdirection *= -1;
  }
  if (xpos == 960 && (ypos >= blockerY -10 && ypos <= blockerY + 70)){
    xdirection *= -1;
  }
   f = createFont("Ariel", 16, true);
  textFont(f, 16);
  fill(0);
  text("Score   Opponent " + TS2 / 2, 20, 20);
  text("Score Wild " + TS1 / 2, 880, 20);
  ellipse(xpos, ypos, rad, rad);
 
    if (keyz[0] == true){
      if (blockerY >= 0) {
          blockerY = blockerY - blockerH*0.2;
      }}
    if (keyz[1] == true){
      if(blockerY <= height - blockerH) {
          blockerY = blockerY + blockerH*0.2;
      }}
    if (keyz[2] == true){
      if (blockerY2 >= 0) {
          blockerY2 = blockerY2 - blockerH2*0.2;
      }}
    if (keyz[3] == true){
      if(blockerY2 <= height - blockerH2) {
          blockerY2 = blockerY2 + blockerH2*0.2;
      }}
    if (TS1 >= 14 || TS2 >= 14){
      noLoop();
      //reDraw(); __ Wins
    }
  }
