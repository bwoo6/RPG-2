class weapon extends GameObjects {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int damage;
  
  weapon() {
    shotTimer=0;
    threshold =30;
    bulletSpeed=5;
  }

  weapon (int thr, int bs) {
    shotTimer=0;
    threshold=thr;
    bulletSpeed=bs;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myCharacter.loc.x, mouseY-myCharacter.loc.y);
      aimVector.setMag(bulletSpeed+myCharacter.damage);
      myObjects.add(new Bullet(aimVector, white, 10));
      shotTimer=0;
    }
  }
}

class sniperRifle extends weapon {
  sniperRifle() {
    super(75, 25);
  }
}

class AutoPistol extends weapon {
  AutoPistol() {
    super(15, 10);
  }
}

class shotGun extends weapon {
  shotGun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_BULLETSPEED);
  }
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myCharacter.loc.x, mouseY-myCharacter.loc.y);
      aimVector.setMag(bulletSpeed+myCharacter.damage);
      myObjects.add(new Bullet(aimVector.rotate(random(0.1, -0.1)), white, 10));   
      myObjects.add(new Bullet(aimVector.rotate(random(0.1, -0.1)), white, 10));   
      myObjects.add(new Bullet(aimVector.rotate(random(0.1, -0.1)), white, 10));
      myObjects.add(new Bullet(aimVector.rotate(random(0.1, -0.1)), white, 10));
      shotTimer=0;
    }
  }
}
