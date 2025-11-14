import fisica.*;

//jenny yu
//block 1-4
//november 10, 2025

//palette
color blue   = #a2d2ff;
color brown  = #ab7743;
color green  = #9cc97f;
color red    = #d65859;
color yellow = #ffd04d;
color white  = #ffffff;

//button
boolean mouseReleased;
boolean wasPressed;
boolean newLivesOn;
boolean gravityOff;
button gravityButton;
button newFBodiesButton;

//assets
PImage redBird;
PImage spongebob;

FPoly topPlatform;
FPoly bottomPlatform;
FPoly bucket;

//clouds
float cloudBx = -200, cloudBy = 120;
float cloudFx = -200, cloudFy = 300;
float cloudBspeed = 0.7, cloudFspeed = 1.2;

//fisica
FWorld world;


void setup() {
  //make window
  size(800, 600);

  //load resources
  redBird = loadImage("red-bird.png");
  spongebob = loadImage("spongebob.jpg");
  spongebob.resize(35, 35);

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  //makeBottomPlatform();
  makeBucket();

  //add button to world
  gravityButton = new button("gravity", 80, 540, 80, 60, yellow, red);
  newFBodiesButton = new button("new", 720, 50, 80, 60, green, yellow);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  gravityOff = false;
  newLivesOn = true;
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, 80);
  topPlatform.vertex(640, 260);
  topPlatform.vertex(640, 360);
  topPlatform.vertex(-100, 180);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(900, 360);
  bottomPlatform.vertex(300, 480);
  bottomPlatform.vertex(300, 580);
  bottomPlatform.vertex(900, 460);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}

//===========================================================================================

void makeBucket() {
  bucket = new FPoly();

  //plot the vertices of this platform
  bucket.vertex(790, 420);
  bucket.vertex(770, 600);
  bucket.vertex(620, 600);
  bucket.vertex(600, 420);
  bucket.vertex(610, 420);
  bucket.vertex(630, 590);
  bucket.vertex(760, 590);
  bucket.vertex(780, 420);

  //define properties
  bucket.setStatic(true);
  bucket.setFillColor(brown);
  bucket.setFriction(0);

  //put it in the world
  world.add(bucket);
}

//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (frameCount % 50 == 0 && newLivesOn == true) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }

  //cloud back
  makeCloudB(cloudBx, cloudBy);
  cloudBx += cloudBspeed;
  if (cloudBx > width+50) {
    cloudBx = -200;
  }

  //buttons
  click();
  gravityButton.show();
  newFBodiesButton.show();

  if (newFBodiesButton.clicked) {
    newLivesOn = !newLivesOn;
  }

  if (gravityButton.clicked) {
    gravityOff = !gravityOff;
    gravityOnOff();
  }

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  //cloud front
  makeCloudF(cloudFx, cloudFy);
  cloudFx += cloudFspeed;
  if (cloudFx > width+100) {
    cloudFx = -200;
  }
}

//===========================================================================================

void gravityOnOff() {
  if (gravityOff == true) {
    world.setGravity(0, 0);
  } else {
    world.setGravity(0, 900);
  }
}

//===========================================================================================

void makeCloudB(float x, float y) {
  noStroke();
  fill(white);
  ellipse(x, y, 30, 40);
  ellipse(x+20, y+30, 45, 50);
  ellipse(x-30, y+20, 60, 45);
  ellipse(x-10, y-10, 50, 40);
  ellipse(x-35, y-5, 35, 30);
  ellipse(x+30, y+5, 45, 40);
  ellipse(x+5, y+25, 50, 35);
}

//===========================================================================================

void makeCloudF(float x, float y) {
  noStroke();
  fill(white);
  ellipse(x, y, 60, 50);
  ellipse(x+35, y+10, 50, 50);
  ellipse(x+55, y+27, 50, 45);
  ellipse(x+30, y+45, 50, 40);
  ellipse(x-5, y+40, 60, 55);
  ellipse(x-25, y+20, 60, 50);
}

//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(100, width-100), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100, width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  //FBox box = new FBox(25, 100);
  FBox box = new FBox(35, 35);
  box.setPosition(random(100, width-100), -5);

  //set visuals
  /*box.setStroke(0);
   box.setStrokeWeight(2);
   box.setFillColor(green); */
  //box.setSize(35);
  box.attachImage(spongebob);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  //box.setRestitution(0.25);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(100, width-100), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
