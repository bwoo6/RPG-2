//Color palletes
color cyan  = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;
color maroon = #862E2E;
color grey = #717171;
color darkred= #B44545;
color red=#FF0000;
color greeen=#00FF00;
color purple=#891A71;

//HPS/THRESHOLD
final int TURRET_SIZE=50;
final int TURRET_THRESHOLD = 60;
final int TURRET_BULLET_SPEED=5;
final int TURRET_HP=500;

final int FOLLOWER_HP=250;
final int FOLLOWER_THRESHOLD=200;

//Weapons
final int SHOTGUN_THRESHOLD = 75;
final int SHOTGUN_BULLETSPEED=10;

final int sniperRifle=0;
final int shotGun=1;
final int AutoPistol=2;
final int health=3;
final int ammo=4;

//Buttons
boolean mouseReleased;
boolean hadPressed;
color bkg; 
Button blackButton, DButton, HButton, SButton;

//GIFS
AnimatedGIF introGIF;
AnimatedGIF manUp;
AnimatedGIF manDown;
AnimatedGIF manLeft;
AnimatedGIF manRight;


//Images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//Visual Effects
int textAngels;
PFont a;

boolean wkey, skey, akey, dkey, space, pause;

//Game Objects
ArrayList<DarknessCell> darkness;


//Game OBjects 2
ArrayList<GameObjects> myObjects;
character myCharacter;

weapon myWeapon;

final int START= 0;
final int GAME = 1;
final int PAUSE= 2;
final int END = 3;
final int INTRO=4;
final int WIN=5;
final int LOSE=6;
int mode;

PFont pixel;

void setup() {
  size(1000, 600);
  mode=INTRO;
  myObjects=new ArrayList<GameObjects>();
  bkg=white;
  pixel=createFont("pixel.ttf", 200);
  textFont(pixel);
  introGIF=new AnimatedGIF(62, "frame_", "_delay-0.2s.gif");
  //GIFs
  manUp = new AnimatedGIF(4, 10, "man/up/sprite_", ".png");
  manDown = new AnimatedGIF(4, 10, "man/down/sprite_", ".png");
  manLeft = new AnimatedGIF(4, 10, "man/left/sprite_", ".png");
  manRight = new AnimatedGIF(4, 10, "man/right/sprite_", ".png");

  //Button
  blackButton=new Button("START", 500, 450, 200, 65, black, white, 50);
  DButton=new Button("+", 900, 100, 50, 40, black, white, 50);
  HButton=new Button("+", 900, 200, 50, 40, black, white, 50);
  SButton=new Button("+", 900, 300, 50, 40, black, white, 50);


  //Creating Objects
  myObjects=new ArrayList<GameObjects>(1000);
  myCharacter=new character();
  myObjects.add(myCharacter);

  //Darkness
  darkness = new ArrayList<DarknessCell>();
  initializedarkness();

  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  map=loadImage("Map.png");

  //loading the enemies from the map
  int x=0;
  int y=0;
  while (y<map.height) {
    color roomColor = map.get(x, y);
    if (roomColor==darkred) {
      myObjects.add(new Turret(x, y));
      myObjects.add(new Turret(x+50, y+50));
    }
    if (roomColor==green) {
      myObjects.add(new Follower(x, y));
      myObjects.add(new Follower(x, y));
    }

    if (roomColor==red) {
      myObjects.add(new Follower(x, y));
      myObjects.add(new Turret(x, y));
    }

    if (roomColor==purple) {
      myObjects.add(new Boss(x,y));
    }
    x++;
    if (x==map.width) {
      x=0;
      y++;
    }
  }
}

void draw() {
  background(bkg);
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WIN) {
    win();
  }else if (mode == LOSE) {
   lose(); 
  }else {
    println("Error: Mode = " + mode);
  }

  mouseReleased = false;
  if (mousePressed) hadPressed=true;
  if (hadPressed&&!mousePressed) {
    mouseReleased = true;
    hadPressed=false;
  }
}

void initializedarkness() {
  float x=0;
  float y=0;
  while (x <= width && y<=height) {
    float size=8;
    darkness.add(new DarknessCell(x, y, size));
    x+=size;
    if (x>=width) {
      y+=size;
      x=0;
    }
  }
}
