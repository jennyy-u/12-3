import fisica.*;

//jenny yu
//block 1-4
//november 10, 2025

//palette
color blue   = #a2d2ff;
color brown  = #ab7743;
color green  = color(74, 163, 57);
color red    = #d65859;
color yellow = #ffd04d;
color white  = #ffffff;

//button
boolean mouseReleased;
boolean wasPressed;

button gravityButton;
button newFBodiesButton;

//assets
PImage redBird;
PImage spongebob;

FPoly topPlatform;
FPoly bottomPlatform;
FPoly bucket;
FPoly cloud;

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
  //makeCloud();
  
  //add button to world
  gravityButton = new button("gravity", 80, 520, 100, 60, yellow, red);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
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

void makeCloud() {
  cloud = new FPoly();
  
  //plot the vertices of this platform
  pushMatrix();
  stroke(white);

  ellipse(100, 100, 30, 40);
  
  popMatrix();
  
  //define properties
  cloud.setStatic(true);
  cloud.setFillColor(white);
  
  //put it in the world
  world.add(cloud);
}




//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (frameCount % 50 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  
  //button
  click();
  gravityButton.show();
  if (gravityButton.clicked) {
    
  }
  
  
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
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
