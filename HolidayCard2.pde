int maxStarSize = 20;
String graphicsMode =  P2D;
ArrayList charsFalling;
 
class snowflakes {
  int mover, drop, tips;
  float my, flakeSize, rotation;
  snowflakes(int x, int y)
      {mover = x;
       my = y;
       drop = 255;
       flakeSize = random(maxStarSize);
       rotation = random(TWO_PI);
       tips = 5 + (int)random(5);
      }
     
  boolean notVisible() {
    if (my < 0) {
    return false;
  }
    else
    return (my > height) || (drop < 0)  || (flakeSize < 1.5);
    }
   
  void display()
    {
      if (!notVisible()){
      fill(color(255,255,255), drop);
      pushMatrix();
      translate(mover - flakeSize /2, my - flakeSize /2);
      rotate(rotation);
      star(tips,flakeSize, flakeSize/4);
      popMatrix();
      }
    }
     
   void fall()
    {
      drop = drop - 1;
      my = my + 1 + flakeSize / 5;
      flakeSize = flakeSize * 0.99;
    }
}
 
void CreateChar(int n)
{
      int x = (int)random(width);
      int y = (int)random(height/ n);
      if (n == 1) 
      charsFalling.add(new snowflakes(x, y)); 
      else 
      charsFalling.add(new snowflakes(x, -y));  
}
 
void setup()
{
  size(700, 350, P2D);
  colorMode(RGB, 255, 255, 255, 255);
  charsFalling = new ArrayList(); 
  for( int i = 0; i< 60; i++) 
    CreateChar(1); 
}
 
void draw()
{
  background(0);
  for (int i = charsFalling.size()-1; i >= 0; i--)
  {  
      snowflakes fc = (snowflakes) charsFalling.get(i);
      if (fc.notVisible() ) charsFalling.remove(i);
      else
      {
        fc.fall();
        fc.display();
      }
  }
  if ((frameCount & 2) > 0 )
  {
    int x = (int)random(4);
    for (int j = 0; j < x; j++)
      {
          CreateChar(4);  
          CreateChar(8); 
      }
        }
        textSize(50);
        fill(255,0,0);
        text("Happy Holidays!", 50, 50);
}
 
void star(int nPoints, float rad1, float rad2)
{
float angle = TWO_PI / nPoints;
float angle2 = angle / 2;
float angleOne = 0.0;
beginShape();
fill(255,255,255);
stroke(255,255,255);
strokeWeight(0);
for (int i = 0; i < nPoints; i++)
  {
  float y1 = rad1 * sin(angleOne);
  float x1 = rad1 * cos(angleOne);
  float y2 = rad2 * sin(angleOne + angle2);
  float x2 = rad2 * cos(angleOne + angle2);
  vertex(x1, y1);
  vertex(x2, y2);
  angleOne += angle;
  }
endShape(CLOSE);
}
