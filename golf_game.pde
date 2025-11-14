import fisica.*;

//jenny yu
//block 1-4
//november 14, 2025

//palette
color white = #ffffff;
color black = #000000;

//locked assets
FPoly base;

//interacting assets
FCircle ball;

//fisica
FWorld world;

void setup() {
  size(1000, 600);

  //initialise world
  makeWorld();

  //add terrain
  makeBase();
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
  base.vertex(0, 310);
  base.vertex(100, 310);
  base.vertex(200, 430);
  base.vertex(280, 430);
  base.vertex(350, 350);
  base.vertex(380, 285);
  base.vertex(450, 285);
  base.vertex(520, 360);
  base.vertex(600, 400);
  base.vertex(700, 380);
  base.vertex(720, 360);
  base.vertex(760, 340);
  base.vertex(780, 320);
  base.vertex(810, 300);
  base.vertex(850, 270);
  base.vertex(870, 250);
  base.vertex(width, 250);
  base.vertex(width, height);
  base.vertex(0, height);

  //define properties
  base.setStatic(true);
  base.setFillColor(black);

  //put into world
  world.add(base);
}

//===========================================================================================

void draw() {
  background(white);

  world.step();
  world.draw();
}
