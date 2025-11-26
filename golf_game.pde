import fisica.*;

//jenny yu
//block 1-4
//november 14, 2025

//palette
color white = #ffffff;
color black = #000000;
color blue   = #d1e8fc;
color green = #88b586;
color yellow = #ffeebc;
color sand = #f1e3d1;

//mode framework
final int INTRO = 0;
final int GAME1 = 1;
final int GAMEOVER = 2;
int mode = GAME1;

FCircle ball;
FCircle ball2;

//keys
boolean upKey, downKey, leftKey, rightKey, spaceKey;

//locked assets
FPoly base;
FBox endSpot;
FBlob ssand;

//fisica
FWorld world;

void setup() {
  size(1000, 700);

  //initialise world
  makeWorld();

  //add terrain
  makeBase();
  makeBall();
  makeEndSpot();
  makeSand();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
}

//===========================================================================================

void makeBase() {
  base = new FPoly();

  //plot
  base.vertex(0, 410);
  base.vertex(100, 410);
  base.vertex(200, 530);
  base.vertex(280, 530);
  base.vertex(350, 450);
  base.vertex(380, 385);
  base.vertex(450, 385);
  base.vertex(520, 460);
  base.vertex(600, 500);
  base.vertex(700, 480);
  base.vertex(720, 560);
  base.vertex(760, 540);
  base.vertex(780, 420);
  base.vertex(810, 400);
  base.vertex(850, 370);
  base.vertex(870, 350);
  base.vertex(910, 350);
  base.vertex(920, 360);
  base.vertex(940, 390);
  base.vertex(975, 390);
  base.vertex(980, 300);
  base.vertex(width, 300);
  base.vertex(width, height);
  base.vertex(0, height);

  //define properties
  base.setStatic(true);
  base.setFillColor(green);

  //put into world
  world.add(base);
}

//===========================================================================================

void draw() {
  background(blue);

  //mode
  if (mode == INTRO) intro();
  else if (mode == GAME1) game1();
  else if (mode == GAMEOVER) gameover();
}

//===========================================================================================
void makeEndSpot() {
  endSpot = new FBox(35, 10);
  endSpot.setPosition(957, 0);

  //set visuals
  endSpot.setStroke(green);
  endSpot.setStrokeWeight(2);
  endSpot.setFillColor(white);

  //set physical properties
  endSpot.setDensity(0.2);
  endSpot.setFriction(1);
  world.add(endSpot);
}

//===========================================================================================

void makeBall() {
  ball = new FCircle(30);
  ball.setPosition(20, 0);

  //set visuals
  ball.setStroke(white);
  ball.setStrokeWeight(2);
  ball.setFillColor(white);

  //set physical
  ball.setDensity(0.2);
  ball.setFriction(1);
  ball.setRestitution(0.2);

  //add to world
  world.add(ball);
}

//===========================================================================================

void makeBall2() {
  ball2 = new FCircle(30);
  ball2.setPosition(20, 0);

  //set visuals
  ball2.setStroke(yellow);
  ball2.setStrokeWeight(2);
  ball2.setFillColor(yellow);

  //set physical
  ball2.setDensity(0.2);
  ball2.setFriction(1);
  ball2.setRestitution(0.2);

  //add to world
  world.add(ball2);
}

//===========================================================================================

void makeSand() {
  ssand = new FBlob();
  ssand.setPosition(730, 0);

  //set visuals
  ssand.setAsCircle(730, -5, 30);
  ssand.setStroke(sand);
  ssand.setStrokeWeight(2);
  ssand.setFillColor(sand);

  //set physical properties
  ssand.setDensity(0.2);
  ssand.setFriction(1);
  ssand.setRestitution(0.25);

  //add to the world
  world.add(ssand);
}
