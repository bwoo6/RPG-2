class enemyBullets extends GameObjects {
  float vx, vy;
  PImage image;
  enemyBullets(PVector enemyloc) {
    vel=new PVector(myCharacter.loc.x-enemyloc.x, myCharacter.loc.y-enemyloc.y);
    hp=1;
    stroke(red);
    fill(red);
    loc=enemyloc.copy();
    vel.setMag(3);
    size = 5;
    roomX=myCharacter.roomX;
    roomY=myCharacter.roomY;
    image=loadImage("EBullet.png");
  }

  void show() {
   pushMatrix();
  translate(loc.x,loc.y);
  rotate(vel.heading());
  imageMode(CENTER);
  image(image,size,size,size*10,size*10);
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
