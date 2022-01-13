void game() {
  drawRoom();
  drawGameObjects();
  drawDarkness();
  drawMinimap();
} 



void drawRoom() {
  background(grey);

  stroke(black);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  rectMode(CENTER);
  stroke(black);
  fill(yellow);
  rect(width/2, height/2, width*0.8, height*0.8);


  northRoom = map.get(myCharacter.roomX, myCharacter.roomY-1);
  eastRoom = map.get(myCharacter.roomX+1, myCharacter.roomY);
  southRoom = map.get(myCharacter.roomX, myCharacter.roomY+1);
  westRoom = map.get(myCharacter.roomX-1, myCharacter.roomY);

  noStroke();
  fill(black);
  if (northRoom!=#FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom!=#FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom!=#FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom!=#FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  //Floor
  rectMode(CENTER);
  stroke(black);
  fill(maroon);
  rect(width/2, height/2, width*0.8, height*0.8);
}


void drawGameObjects() {

  for (int i=0; i<myObjects.size(); i++ ) {
    GameObjects obj = myObjects.get(i);
    if (obj.roomX==myCharacter.roomX && obj.roomY==myCharacter.roomY) {
      obj.show();
      obj.act();
      if (obj.hp<=0) {
        myObjects.remove(i);
        i--;
      }
    }
  }
}

void drawDarkness() {
  noStroke();
  int i=0;
  while (i<darkness.size()) {
    darkness.get(i).show();
    i++;
  }
}

void drawMinimap() {
  noStroke();
  int x= 50;
  int y=50;
  int mx= 0;
  int my=0;

  while (my <= map.height-1) {
    color c=map.get(mx, my);
    fill(c);
    if (myCharacter.roomX==mx && myCharacter.roomY==my)
      fill(0,255,0);
    square(x, y, 10);
    x+=10;
    mx+=1;
    if (mx>map.width-1) {
      mx=0;
      y+=10;
      x=50;
      my++;
    }
  }
}
