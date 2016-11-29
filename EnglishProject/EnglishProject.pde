//Benedict Donnay and Trevor Liggett
//English Project for the book "Animal Dreams" by Barbara Kingsolver
//Period 4 McGovern 11/29/2016
//Code used from Sine Wave by Daniel Shiffman.  
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
double colorBarrier;
float theta = 0.0;  // Start angle at 0
float amplitude = 25.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
PImage mine;
PImage peacock;


/*void mousePressed() {
 for(for each loop incrementing though the peacocks){ 
 if(the mousepressed within the demesions of the peacock){
 colorbarrier -=10;
 }
 }
 }*/

void setup() {
  size(3000, 1500);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  colorBarrier = 0;
  frameRate(120);
  mine = loadImage("mine3.gif");
  peacock = loadImage("peacock.png");
}

void draw() {
  background(78, 185, 255);  
  fill(240, 200, 10);
  ellipse(2550, 425, 400, 400);
  fill(232, 167, 56);
  rect(0, 400, 3000, 1500);
  calcWave();
  colorWave();
  renderWave();
  drawTrees();
  image(mine, 0, 0, 600, 600);
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
    if (x < colorBarrier) {
      fill(122, 181, 6);
    } else {
      fill(35, 185, 255);
    }
    ellipse(x*xspacing, height/2+yvalues[x], 150, 150);
  }
}
void colorWave() {
  colorBarrier += 0.25;
}

void drawTrees() {
  for (int i = 0; i < 10; i ++) {
    for (int j = 0; j < 3; j++) {
      fill(169, 112, 91);
      rect(i * 300 + 150, j * 150 + 1000, 40, 100);
      if ((i * 19 + 10)< colorBarrier) {
        fill(0);
      } else {
        fill(0, 255, 0);
      }
      ellipse(i * 300 + 170, j * 150 + 1000, 80, 80);
    }
  }
}