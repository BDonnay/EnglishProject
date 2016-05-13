class checkedges{
  void CheckEdges(){
    if (location.x > width-rad/2){ // FIX THE GOALS TO USE THIS
      location.x = width-rad/2;
      velocity.x *= -1;
    } 
    else if (location.x < rad/2) {
     location.x = rad/2;
      velocity.x *= -1;
    } 
    else if (location.y > height-rad/2) {
      location.y = height-rad/2;
      velocity.y *= -1;
    } 
    else if (location.y < rad/2) {
      location.y = rad/2;
      velocity.y *= -1;
    }
  
  if (location.x == 20 &&(location.y > 170 && location.y < 330)){
      TS1++;
  }
  if (location.x == 980 && (location.y > 170 && location.y < 330)){
      TS2++;
  }
  }}