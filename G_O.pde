class GameObjects {
  int size;
  PVector loc;
  PVector vel;
  int hp;
  int roomX, roomY;
  color Color;
  int xp;
  int MaxHP;
  int damage;
  GameObjects() {
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    damage=1;
  }

  void show() {
  }

  void act() {
    loc.add(vel);

    if (loc.x<width*0.12)  loc.x=width*0.12;
    if (loc.x>width*0.88)  loc.x=width*0.88;
    if (loc.y<height*0.135) loc.y=height*0.135;
    if (loc.y> height*0.865) loc.y=height*0.865;
  }
}
