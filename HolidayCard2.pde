float [] xPosition = new float[100];
float [] yPosition = new float[100];
int [] flakeSize = new int[100];
int [] direction = new int[100];
int minFlakeSize = 4;
int maxFlakeSize = 5;


void setup(){
size (700,500);
ellipseMode(CENTER);
noStroke();
  for(int i = 0; i < 100; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(600,800);
    yPosition[i] = random(100, 50);
    direction[i] = round(random(0, 1));
  }
}

void draw(){
background(47,79,79);
textSize(48);
fill(255,0,0);
text("Merry", 50,50);
fill(0,255,0);
text("Christmas",50,100);
fill(66,36,18);
rect(100,450,100,50);
fill(47,79,79);
ellipse(100,475,40,50);
ellipse(200,475,40,50);
fill(0,100,0);
triangle(50,450,150,300,250,450);
triangle(65,385,150,250,235,385);
triangle(75,325,150,220,225,325);
fill(255,198,0);
 beginShape();
  vertex(150, 150);
  vertex(164, 180);
  vertex(197, 185);
  vertex(173, 207);
  vertex(179, 240);
  vertex(150, 225);
  vertex(121, 240);
  vertex(127, 207);
  vertex(103, 185);
  vertex(136, 180);
  endShape(CLOSE);
  fill(66,36,18);
  rect(375,25,250,250); 
  fill(97,203,255);
  rect(400,50,200,200);
  fill(255);
  for(int i = 0; i < xPosition.length; i++) {
    
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    if(xPosition[i] > 600 - flakeSize[i] || xPosition[i] < 400 + flakeSize[i] || yPosition[i] > 250 - flakeSize[i]) {
      xPosition[i] = random(400, 600);
      yPosition[i] = random(50,100);
    }
    
  }
  fill(66,36,18);
  rect(490,25,20,240);
  rect(400,140,200,20);
}
