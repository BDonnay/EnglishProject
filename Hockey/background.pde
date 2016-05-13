class background{
  void Background(){
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
  fill(34,139,34);
  rect(0, 170, 4, 160);//goal opp
  fill(210,35,29);
  rect(996, 170, 4, 160);//goal wild
  }
  void Text(){
  textFont(f, 16);
  fill(0);
  text("Score   Wild " + TS2 / 2, 20, 20);
  text("Score Blackhawks " + TS1 / 2, 840, 20);}
}