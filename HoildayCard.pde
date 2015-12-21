int rad = 40;        // Width of the shape 
int TS1 = 0;
int TS2 = 0;
PVector location;
PVector velocity;
float xspeed = 5;  // Speed of the shape
float yspeed = 5;  // Speed of the shape
PFont f;
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
float blockerX = 10;
float blockerY = 10;
float blockerW = 75;
float blockerH = 75;
float blockerX2 = 10;
float blockerY2 = 10;
float blockerW2 = 75;
float blockerH2 = 75;

boolean keyz[] = new boolean [8];

void keyPressed() {
  if (keyCode == UP) keyz[0] = true;
  if (keyCode == DOWN) keyz[1] = true;
  if (key == 'w') keyz[2] = true;
  if (key == 's') keyz[3] = true;
  if (keyCode == LEFT) keyz[4] = true;
  if (keyCode == RIGHT) keyz[5] = true;
  if (key == 'a') keyz[6] = true;
  if (key == 'd') keyz[7] = true;}
  
void keyReleased() {
   if (keyCode == UP) keyz[0] = false;
  if (keyCode == DOWN) keyz[1] = false;
  if (key == 'w') keyz[2] = false;
  if (key == 's') keyz[3] = false;
  if (keyCode == LEFT) keyz[4] = false;
  if (keyCode == RIGHT) keyz[5] = false;
  if (key == 'a') keyz[6] = false;
  if (key == 'd') keyz[7] = false;}


void setup() 
{
  size(1000, 500);
  fill(233,20,31);
  noStroke();
  frameRate(30);
  ellipseMode(CENTER);
  location = new PVector(width / 2, height /2);
  velocity = new PVector(5,5);
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
  ellipse(blockerX, blockerY, blockerW, blockerH);
  fill(233, 70, 228);
  ellipse(blockerX2, blockerY2, blockerW2, blockerH2);
  location.add(velocity);
  if (location.x > width || location.x < 0) {
    velocity.x = velocity.x * -1;
  }
 if (location.y > height || location.y < 0) {
    velocity.y = velocity.y * -1; 
  }
  if (location.x == 20 &&(location.y > 170 && location.y < 330)){
      TS1++;
  }
  if (location.x == 980 && (location.y > 170 && location.y < 330)){
      TS2++;
  }
  if (dist(location.x, location.y, blockerX, blockerY) <= (blockerW + rad) / 2){
    velocity.x = velocity.x * -1;
   // velocity.y = velocity.y * -1;
  }
    if (dist(location.x, location.y, blockerX2, blockerY2) < (blockerW + rad) /2){
    velocity.x = velocity.x * -1;
    //velocity.y = velocity.y * -1;
  }
   f = createFont("Ariel", 16, true);
  textFont(f, 16);
  fill(0);
  text("Score   Opponent " + TS2 / 2, 20, 20);
  text("Score Wild " + TS1 / 2, 880, 20);
   ellipse(location.x,location.y, rad ,rad);
 
  if (keyz[0] == true){
      if (blockerY >= 0) {
          blockerY = blockerY - blockerH*0.1;
      }}
  if (keyz[1] == true){
      if(blockerY <= height - .5 *blockerH) {
          blockerY = blockerY + blockerH*0.1;
      }}
    if (keyz[2] == true){
      if (blockerY2 >= 37) {
          blockerY2 = blockerY2 - blockerH2*0.1;
      }}
    if (keyz[3] == true){
      if(blockerY2 <= height - .5 *blockerH2) {
          blockerY2 = blockerY2 + blockerH2*0.1;
      }}
    if (keyz[4] == true){
      if (blockerX >= 537 && blockerX <= 1000) {
          blockerX = blockerX - blockerW*0.1;
      }}
    if (keyz[5] == true){
      if(blockerX <= width - .5 * blockerW) {
          blockerX = blockerX + blockerW*0.1;
      }}
    if (keyz[6] == true){
      if (blockerX2 <= 467 && blockerX2 >= 0){
          blockerX2 = blockerX2 - blockerW2*0.1;
      }}
    if (keyz[7] == true){
      if(blockerX2 <= 500 - .5 * blockerW) {
          blockerX2 = blockerX2 + blockerW2*0.1;
      }}  
    if (TS1 >= 14 || TS2 >= 14){
      noLoop();
      //reDraw(); __ Wins
    }
  }
