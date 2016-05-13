checkedges Checkedges;
background Background;
keypress Keypress;
win WIN;
public int rad = 40;  // Width of the shape 
public int TS1 = 0, TS2 = 0;
public PVector location, velocity, location1, velocity1, location2, velocity2;
public PFont f;
public double xdirection = 1, ydirection = 1;  // Left or Right // Top to Bottom
public float blockerW = 75, blockerH = 75, blockerW2 = 75, blockerH2 = 75;
public boolean firstMenu = false, secondMenu = false, inGame = true;
public boolean keyz[] = new boolean [8];
void keyPressed() {
  if (keyCode == UP) keyz[0] = true;
  if (keyCode == DOWN) keyz[1] = true;
  if (key == 'w') keyz[2] = true;
  if (key == 's') keyz[3] = true;
  if (keyCode == LEFT) keyz[4] = true;
  if (keyCode == RIGHT) keyz[5] = true;
  if (key == 'a') keyz[6] = true;
  if (key == 'd') keyz[7] = true;
}
void keyReleased() {
  if (keyCode == UP) keyz[0] = false;
  if (keyCode == DOWN) keyz[1] = false;
  if (key == 'w') keyz[2] = false;
  if (key == 's') keyz[3] = false;
  if (keyCode == LEFT) keyz[4] = false;
  if (keyCode == RIGHT) keyz[5] = false;
  if (key == 'a') keyz[6] = false;
  if (key == 'd') keyz[7] = false;
}
void setup(){
  size(1000, 500);
  fill(233, 20, 31);
  if(secondMenu){
    setupsecondmenu();}
  if(inGame){
     setupgame();}
}
void draw(){
  if(firstMenu){
    firstMenu();}
  if(secondMenu){
    secondMenu();}
  if(inGame){
    Game();}
}
void firstMenu(){
}
void secondMenu(){
}
void setupsecondmenu(){
}
void setupgame() 
{
  noStroke();
  ellipseMode(CENTER);
  location = new PVector(width / 2, height /2);
  location1 = new PVector(10, 10);
  location2 = new PVector(990, 10);
  velocity = new PVector(5, 5);
  velocity1 = new PVector(.1 * blockerH, .1 * blockerW);
  velocity2 = new PVector(.1 * blockerH2, .1 * blockerW2);
  frameRate(60);
  location1.x = width - 40;
  location2.x = 40;
  location1.y = height/2;
  location2.y = height/2;
  f = createFont("Ariel", 16, true);
  Checkedges = new checkedges();
  Background = new background();
  Keypress = new keypress();
  WIN = new win();
}

void Game() 
{
  Background.Background();
  fill(210,35,29);
  ellipse(location1.x, location1.y, blockerW, blockerH);
  fill(34,139,34);
  ellipse(location2.x, location2.y, blockerW2, blockerH2);
  location.add(velocity);
  Checkedges.CheckEdges();
  Background.Text();


  if (dist(location.x, location.y, location1.x, location1.y) <= (blockerW + rad) / 2) {
    velocity.x = velocity.x * -1;
  }
  if (dist(location.x, location.y, location2.x, location2.y) < (blockerW + rad) /2) {
    velocity.x = velocity.x * -1;
  }
  ellipse(location.x, location.y, rad, rad);
  Keypress.Keypress();
  if (TS1 >= 14 || TS2 >= 14) {
    noLoop();
    WIN.Win();
  }
} //