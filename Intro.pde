void intro() {
  introGIF.show();
  fill(white);
  textFont(pixel);
  textSize(100);
  text("DUNGEON CRAWL",510,100);
  blackButton.show();
  if (blackButton.clicked) {
    mode = GAME;
  }
}  
