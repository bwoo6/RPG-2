void lose() {

  background(255, 0, 0);
  fill(0);
  textSize(50);
  text("YOU DIED!!", 600, 100);
  textSize(30);
  text("CLICK ANYWHERE TO RESTART!", height/2, width/2);
}

void loseClicks() {
  if (dist(mouseX, mouseY, 0, 0) <1200) {
    myObjects.clear();
    setup();
    mode=INTRO;
  }
}
