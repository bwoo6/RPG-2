class DroppedItem extends GameObjects {
  int type;
  weapon w;
  PImage display;
  DroppedItem(float x, float y, int rx, int ry) {
    type = (int)random(0, 4);
    hp=1;
    loc = new PVector (x, y);
    vel= new PVector(0, 0);
    size =50;
    roomX=rx;
    roomY=ry;
    Color=cyan;
    
      if(type==health) {
      display=loadImage("HP.png");
    }
       if(type==sniperRifle) {
      display=loadImage("Sniper.png");
    }
       if(type==shotGun) {
      display=loadImage("Shotgun.png");
    }
       if(type==AutoPistol) {
      display=loadImage("Pistol.png");
    }
  }

  void show() {
   image(display,loc.x,loc.y,size,size);
  }
  void act() {
   // do nothing, not even get shot or move 
  }
}
