class flake {

  float x;  
  float y;
  float xVel;
  float yVel; 
  float diameter;

  flake(float xpos, float ypos) {
    x = xpos = random (0, 1200);
    y = ypos;
    xVel = random (-2, 2);
    yVel = random (0, 5);
    diameter = random (5, 10);
  }
}