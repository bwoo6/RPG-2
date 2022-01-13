class Bullet extends GameObjects {

  int lives;
  int damage; 
  PImage image;
  
  Bullet(PVector aim, color c, int s) {
    hp=1;
    loc=new PVector(myCharacter.loc.x, myCharacter.loc.y);
    Color=c;
    vel=aim.copy();    
    size= s;
    roomX=myCharacter.roomX;
    roomY=myCharacter.roomY;
    image=loadImage("Bullet.png");
  }

  void show() {
  pushMatrix();
  translate(loc.x,loc.y);
  rotate(vel.heading());
  imageMode(CENTER);
  image(image,size,size-10,size*3,size*3);
  popMatrix();
  }

  void act() {
    loc.add(vel);
    if (loc.x<=width*0.10)  hp=0; 
    if (loc.x>=width*0.90)  hp=0; 
    if (loc.y<=height*0.10) hp=0; 
    if (loc.y>= height*0.90) hp=0;
  }
}
