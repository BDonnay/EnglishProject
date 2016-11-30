//Benedict Donnay and Trevor Liggett and Sam Haisting
//English Project for the book "Animal Dreams" by Barbara Kingsolver
//Period 4 McGovern 11/29/2016
//Code used from Sine Wave by Daniel Shiffman.  
int xspacing;    // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
double colorBarrier;
float theta = 0.0;  // Start angle at 0
float amplitude; // Height of wave
float period;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
PImage mine;
PImage peacock;
PImage candy;
Peacock Al;
ArrayList<Peacock> peacocks;
int funds;
boolean live;
boolean isSaved;
ArrayList<PVector> candyLoc;
int goal = 15;

/*void mousePressed() {
 for(for each loop incrementing though the peapeacocks){ 
 if(the mousepressed within the demesions of the peacock){
 colorbarrier -=10;
 }
 }
 }*/

void setup() {
  size(1500, 750);

  live = true;
  funds = 0;
  period = width/6;
  peacocks = new ArrayList<Peacock>();
  candyLoc = new ArrayList<PVector>();
  for (int i = 0; i < 4; i++) {
    float x = random(width);
    Al = new Peacock(x);
    peacocks.add(Al);
  }

  xspacing = (int)(width/187.5);
  amplitude =  height/60;  
  w = width+(int)(width/187.5);
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  colorBarrier = 0;
  frameRate(30);
  mine = loadImage("mine3.gif");
  peacock = loadImage("peacock.png");
  candy = loadImage("Candy_Stash.png");
  textSize(30);
}

void draw() {


  background(78, 185, 255);  
  fill(240, 200, 10);
  ellipse((width/1.17647058824), (height/3.52941176471), (width/7.5), (height/3.75));
  fill(232, 167, 56);
  rect(0, (height/3.75), width, height);
  calcWave();
  colorWave();
  renderWave();
  for (PVector p : candyLoc) {
    image(candy, p.x - 30, p.y, 100, 60 ) ;
  }
  for (int i = peacocks.size()-1; i >= 0; i--) {
    peacocks.get(i).move();
    if (peacocks.get(i).location.x > width) {
      peacocks.remove(i);
      Peacock Al = new Peacock();
      peacocks.add(Al);
    }
    peacocks.get(i).display();
  }
  drawTrees();
  if(isSaved == false){
  image(mine, 0, 0, width/5, height/2.5);
  }
  text("Money Raised: " + funds*60 + "/" + goal*60, 1100, 25);

  if (live == false) {
    if (isSaved) {
      text("The River is Saved!!!", width/2 - 160, 25);
    } else {
      text("The River is Gone, Goodbye Grace", width/2 - 250, 25);
    }
  }
}

void mousePressed() {



  if (live == true) {


    for (int i = peacocks.size()-1; i >= 0; i--) {
      if ((Math.abs(peacocks.get(i).location.x + (peacocks.get(i).size.x/2 + (peacocks.get(i).size.y/4)) - mouseX) < 50) && (Math.abs(peacocks.get(i).location.y + ((peacocks.get(i).size.y/2)) - mouseY) < 50)) {
        PVector p = new PVector(mouseX, mouseY);
        candyLoc.add(p);
        if (candyLoc.size() > 20) {
          candyLoc.remove(0);
        }
        peacocks.remove(i);
        colorBarrier -= 5;
        Peacock Al = new Peacock();
        peacocks.add(Al);
        funds += 1;
        if(funds >= goal){
          isSaved = true;
          live = false;
        }
      }
    }
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;


  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
   if(isSaved == false){
     if (x < colorBarrier) {
      fill(122, 181, 6);
    } else {
      fill(35, 185, 255);
    }
   }else{
       fill(35, 185, 255);
   } 
    ellipse(x*xspacing, height/2+yvalues[x], width/20, height/10);
  }
}
void colorWave() {
  if(live){
  colorBarrier += 0.5;
  }
  if (colorBarrier > yvalues.length ) {
    live = false;
  }
}

void drawTrees() {
  for (int i = 0; i < 10; i ++) {
    for (int j = 0; j < 3; j++) {
      fill(169, 112, 91);
      rect(i * (width/10) + (width/20), j * (height/10) + (height/1.5), width/75, height/15);
      if ((i * (width/157.894736842) + width/300)*(width/750) < colorBarrier && isSaved == false) {
        fill(0);
      } else {
        fill(0, 255, 0);
      }
      ellipse(i * (width/10) + (width/17.6470588235), j * (height/10) + (height/1.5), (width/37.5), (height/18.75));
    }
  }
}

class Peacock {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector size;


  public Peacock() {
    size = new PVector(width/7.5, height/7.5);
    location = new PVector(0-(width/7.5), random(300) + 400);
    velocity = new PVector(random(10)+ width/375, 0);
    acceleration = new PVector(0, 0);
  }

  public Peacock(float x) {
    size = new PVector(width/7.5, height/7.5);
    velocity = new PVector(random(8)+ (width/375), 0);
    acceleration = new PVector(0, 0);
    location = new PVector(x, random(300) + 400);
  }

  void move() {
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(15);
  }
  void display() {
    image(peacock, location.x, location.y, size.x, size.y);
  }
}
