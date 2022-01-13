class character extends GameObjects {
  PVector dir;
  float speed;
  boolean isInvincible;
  int invincibleTimer;

  AnimatedGIF currentAction;

  character() {
    super();
    speed= 20;
    roomX=1;
    roomY=1;
    invincibleTimer=255;
    isInvincible=true;
    dir = new PVector(0, -0.1);
    myWeapon=new AutoPistol();
    currentAction=manDown;
    hp=10;
    MaxHP=100;
    xp=0;
  }

  void show() {  
    if (isInvincible==true) {
      stroke(cyan);
      strokeWeight(1);
      circle(loc.x, loc.y, 100);
    }
    currentAction.show(loc.x, loc.y, 30, 50);
    drawHealthbar();
  }


  void drawHealthbar() {
    pushMatrix();
    translate(loc.x, loc.y);
    rectMode(CORNER);
    strokeWeight(1);
    stroke(0);
    fill(red);
    rect(-MaxHP/6, -40, MaxHP/3, 8);
    fill(greeen);
    rect(-MaxHP/6, -40, hp/3, 8);
    rotate(dir.heading());
    popMatrix();
  }


  void act() {
    super.act();  
    
    
    
    
    if (wkey) vel.y=-speed;
    if (akey)vel.x=-speed;
    if (skey)vel.y=speed;
    if (dkey)vel.x=speed;

    if (vel.mag() >speed)
      vel.setMag(speed);
    if (!wkey&&!skey) vel.y=vel.y*0.1;
    if (!akey&&!dkey)vel.x=vel.x*0.1;

    if (abs(vel.y)>abs(vel.x)) {
      if (vel.y>=0) currentAction=manDown;
      else currentAction = manUp;
    } else {
      if (vel.x>0) currentAction=manRight;
      else currentAction=manLeft;
    }
    //Invincibility
    if (isInvincible==true) {
      invincibleTimer=invincibleTimer-3;
    }

    if (invincibleTimer<=0) {
      invincibleTimer=255;
      isInvincible=false;
    }

    int i=0;
    while (i<myObjects.size()) {
      GameObjects myObj = myObjects.get(i);
      if (myObj instanceof Enemy && !isInvincible) {
        if (myObj.roomX==roomX && myObj.roomY==roomY) {
          if (dist(myCharacter.loc.x, myCharacter.loc.y, myObj.loc.x, myObj.loc.y) <=  myCharacter.size+myObj.size) {
            hp=hp-10;
            isInvincible=true;
          }
        }
      }

      if (myObj instanceof enemyBullets && !isInvincible) {
        if (myObj.roomX==roomX && myObj.roomY==roomY) {
          if (dist(myCharacter.loc.x, myCharacter.loc.y, myObj.loc.x, myObj.loc.y) <=  myCharacter.size+myObj.size) {
            hp=hp-10;
            isInvincible=true;
            myObj.hp=0;
          }
        }
      }
      if (myObj instanceof enemyBullets && isInvincible) {
        if (myObj.roomX==roomX && myObj.roomY==roomY) {
          if (dist(myCharacter.loc.x, myCharacter.loc.y, myObj.loc.x, myObj.loc.y) <=  myCharacter.size+myObj.size+50) {
            myObj.hp=0;
          }
        }
      }

      if (myObj instanceof DroppedItem) {
        if (myObj.roomX==roomX && myObj.roomY==roomY) {
          if (dist(myCharacter.loc.x, myCharacter.loc.y, myObj.loc.x, myObj.loc.y) <=  myCharacter.size+myObj.size) {
            DroppedItem item = (DroppedItem) myObj;
            if (item.type==AutoPistol) {
              myWeapon=new AutoPistol();
              item.hp=0;
            }

            if (item.type==shotGun) {
              myWeapon=new shotGun(); 
              item.hp=0;
            }
            if (item.type==sniperRifle) {
              myWeapon=new sniperRifle();
              item.hp=0;
            }
            if (item.type==health) { 
              item.hp=0;
              if (myCharacter.hp<myCharacter.MaxHP) {
                myCharacter.hp=myCharacter.hp+10;
                item.hp=0;
              }
            }
            if (item.type==AutoPistol) {
              myWeapon=new AutoPistol();
              item.hp=0;
            }
          
          }
        }
      }
      i++;
    }



    //Exits
    if (northRoom!=#FFFFFF) {
      if (loc.y<= height*0.135 && loc.x>=width/2-50 && loc.x<=width/2+50) { 
        roomY=roomY-1;
        loc=new PVector(myCharacter.loc.x, height*0.84);
      }
    }
    if (southRoom!=#FFFFFF) {
      if (loc.y >= height*0.865 && loc.x >= width/2-50 && loc.x <= width/2+50) {
        roomY=roomY+1;
        loc=new PVector(myCharacter.loc.x, height*0.16);
      }
    }
    if (eastRoom!=#FFFFFF) {
      if (loc.x >= width *0.88 && loc.y<=height/2+50 && loc.y>=height/2-50) {
        roomX=roomX+1;
        loc=new PVector (width*0.16, myCharacter.loc.y);
      }
    }
    if (westRoom!=#FFFFFF) {
      if (loc.x <= width *0.12 && loc.y<=height/2+50 && loc.y>=height/2-50) {
        roomX=roomX-1;
        loc=new PVector(width*0.86, myCharacter.loc.y);
      }
    }
    myWeapon.update();
    if (space) myWeapon.shoot();
    
      if (myCharacter.xp>=4000) mode=WIN;
    if (hp<=0) {
      println("did");
      mode=LOSE;
    }
  }
}
