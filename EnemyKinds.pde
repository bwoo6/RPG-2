class Follower extends Enemy {
  PImage Follower = loadImage("Follower.png");
  Follower(int x, int y) {
    super(FOLLOWER_HP, TURRET_SIZE, x, y);
    xp=3;
  }

  void show() {
    image(Follower, loc.x, loc.y, size*2, size*2);
  }

  void act() {

    super.act(); 
    vel=new PVector (myCharacter.loc.x-loc.x, myCharacter.loc.y-loc.y);
    vel.setMag(2);
    //ENEMY SHOOTING
    if (ShotTimer <=0) {
      myObjects.add(new enemyBullets(loc));
      ShotTimer=50;
    }
    ShotTimer--;
  }
}



class Turret extends Enemy {
  PImage turretimage = loadImage("Turret.png");
  Turret(int x, int y) {
    super(TURRET_HP, TURRET_SIZE, x, y);
    xp=5;
  }

  void show() {
    image(turretimage, loc.x, loc.y, size*2, size*2);
  }

  void act() {

    super.act(); 
    vel.setMag(2);
    //ENEMY SHOOTING
    if (ShotTimer <=0) {
      myObjects.add(new enemyBullets(loc));
      ShotTimer=20;
    }
    ShotTimer--;
  }
}

class Boss extends Enemy {
  PImage turretimage = loadImage("Turret.png");
  Boss(int x, int y) {
    super(TURRET_HP*5, TURRET_SIZE*2, x, y);
    xp=1000;
  }

  void show() {
    image(turretimage, loc.x, loc.y, size*2, size*2);
  }

  void act() {

    super.act(); 
    vel.setMag(20);
    //ENEMY SHOOTING
    if (ShotTimer <=0) {
      myObjects.add(new enemyBullets(loc));
      
      ShotTimer=5;
    }
    ShotTimer--;
  }
}
