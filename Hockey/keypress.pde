class keypress{
  void Keypress(){
    if (keyz[0] == true){
      if (location1.y >= 0) {
          location1.y = location1.y - velocity1.y;
      }}
  if (keyz[1] == true){
      if(location1.y <= height - .5 *blockerH) {
          location1.y = location1.y + velocity1.y;
      }}
    if (keyz[2] == true){
      if (location2.y >= 37) {
          location2.y = location2.y - velocity2.y;
      }}
    if (keyz[3] == true){
      if(location2.y <= height - .5 *blockerH2) {
          location2.y = location2.y + velocity2.y;
      }}
    if (keyz[4] == true){
      if (location1.x >= 537 && location1.x <= 1000) {
          location1.x = location1.x - velocity1.x;
      }}
    if (keyz[5] == true){
      if(location1.x <= width - .5 * blockerW) {
          location1.x = location1.x + velocity1.x;
      }}
    if (keyz[6] == true){
      if (location2.x <= 500 - blockerH2 / 2 && location2.x >= blockerH2 / 2){
          location2.x = location2.x - velocity2.x;
      }}
    if (keyz[7] == true){
      if(location2.x <= 500 - .5 * blockerW) {
          location2.x = location2.x + velocity2.x;
      }}}  
}