import fisica.*;

//jenny yu
//block 1-4
//november 14, 2025

//palette
color white = #ffffff;
color black = #000000;
color blue   = #d1e8fc;
color green = #88b586;

//mode framework
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
int mode = GAME;

FCircle ball;

//keys
boolean upKey, downKey, leftKey, rightKey, spaceKey;

//locked assets
FPoly base;
FBox endSpot;

//fisica
FWorld world;

void setup() {
  size(1000, 600);

  //initialise world
  makeWorld();

  //add terrain
  makeBase();
  makeBall();
  makeEndSpot();
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
  base.vertex(935, 250);
  base.vertex(940, 290);
  base.vertex(975, 290);
  base.vertex(980, 250);
  base.vertex(width, 250);
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
  else if (mode == GAME) game();
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
  ball.setRestitution(0);

  //add to world
  world.add(ball);
}





//===========================================================================================

void player1() {
  
  
}


//===========================================================================================

void player2() {
  
  
}
