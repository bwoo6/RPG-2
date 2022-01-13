class DarknessCell {
  float opacity;
  float x, y, size;
  float d;
  
  DarknessCell(float X, float Y, float S) {
    size = S;
    x = X;
    y=Y;
    opacity=0;
  }
  void show() {
    d = dist(myCharacter.loc.x, myCharacter.loc.y, x, y );
    opacity = map (d, 0, 150, 0, 255)/2;
    fill(black,opacity);
    square(x, y, size);
  }

  void act() {
  }
}
