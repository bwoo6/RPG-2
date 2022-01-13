void win() {

  background(0, 255, 0);
  fill(0);
  textSize(50);
  text("YOU WIN!!", 600, 100);
  textSize(30);
  text("Click Anywhere to RESTART!", height/2, width/2);
}

void winClicks() {
  if (dist(mouseX, mouseY, 0, 0) <1200) {
    myObjects.clear();
    setup();
    mode=INTRO;
  }
}
