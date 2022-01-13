class message extends GameObjects {
 String text;
 int opactity;
 message(PVector _vel, float x, float y, String t) {
  loc=new PVector(x,y);
  size=50;
  hp=1;
  vel=_vel;
  text=t;
  roomX=myCharacter.roomX;
  roomY=myCharacter.roomY;
 }
 void show() {
  noStroke();
  fill(white);
  textSize(25);
  text(text,loc.x,loc.y);
 }
 
 void act() {
  loc.add(vel); 
 }
}
