void pause() {
  //upgrades
  background(darkred);
  blackButton.show();
  DButton.show();
  HButton.show();
  SButton.show();

  if (blackButton.clicked) {
    mode = GAME;
  }
  if (myCharacter.xp>=5) {


    if (DButton.clicked) {
      myCharacter.damage=myCharacter.damage+1;
      myCharacter.xp=myCharacter.xp-5;
    }
    if (HButton.clicked) {
      myCharacter.MaxHP=myCharacter.MaxHP+3;
      myCharacter.xp=myCharacter.xp-5;
    }
    if (SButton.clicked) {
      myCharacter.speed=myCharacter.speed+1;
      myCharacter.xp=myCharacter.xp-5;
    }
  }
  textSize(50);
  fill(white);
  text("DAMAGE: " + myCharacter.damage, 240, 100);
  text("HP:" + myCharacter.MaxHP, 200, 200);
  text("SPEED: " +myCharacter.speed, 240, 300);
  text("YOU HAVE:"+myCharacter.xp+ "XP", 500, 25);
}
