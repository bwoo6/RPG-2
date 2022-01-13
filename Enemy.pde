class Enemy extends GameObjects {
  float ShotTimer;
  PImage display;
  Enemy() {
    loc = new PVector(random(250,width-250),random(250,height-250));
    vel=new PVector(0, 0);
    hp=100;
    roomX=1;
    roomY=1;
    size=50;
    ShotTimer=20;
  }

  Enemy(int x, int y) {
   loc = new PVector(random(250,width-250),random(250,height-250));
    vel=new PVector(0, 0);
    hp=100;
    roomX=x;
    roomY=y;
    size=50;
    ShotTimer=20;
  }

  Enemy(int HP, int S, int X, int Y) {
     loc = new PVector(random(250,width-250),random(250,height-250));
    vel=new PVector(0, 0);
    hp=HP;
    size=S;
    roomX=X;
    roomY=Y;
  }

  void show() {
    stroke(black);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();
    //ENEMY TAKING DAMAGE
    int i=0;
    while (i<myObjects.size()) {
      GameObjects obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d= dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d<=size/2+obj.size/2) {
          hp=hp- int(obj.vel.mag()*2);
          obj.hp=0;
          if (hp<=0) {
            if (myCharacter.hp<myCharacter.MaxHP) {
              myCharacter.hp=myCharacter.hp+10;
            }
            myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY));
            myObjects.add(new message(new PVector(0,-1), loc.x, loc.y, "+"+xp+"xp"));
            myCharacter.xp=myCharacter.xp+xp;
          }
        }
      }
      i++;
    }
  }
}
