int ballPoints = 0;
int ball2Points = 0;

void game1() {

  background(blue);

  //points

  fill(white);
  textSize(40);
  text(ballPoints, width/2, 70);


  if (ball.isTouchingBody(endSpot)) {
    ball.removeFromWorld();
    makeBall2();
  }
  
  //if (ball2.isTouchingBody(endSpot)) {
    //mode = GAMEOVER;
  //}

  if (mousePressed) {
    ballPoints++;
    float vx = mouseX - ball.getX();
    float vy = mouseY - ball.getY();
    ball.setVelocity(vx, vy);
  }
  

  world.step();
  world.draw();
}

/*
class ball {
 
 //instance variables
 PVector loca;
 PVector velo;
 
 //constructor
 ball(float x, float y, float vx, float vy) {
 loca = new PVector(x, y);
 velo = new PVector(vx, vy);
 }
 
 void show() {
 makeBall();
 }
 
 void act() {
 if (mousePressed) {
 loca.add(velo);
 float vx = mouseX - ball.getX();
 float vy = mouseY - ball.getY();
 ball.setVelocity(vx, vy);
 }
 if (loca.x > width || loca.x < 0 || loca.y > height || loca.y < 0) {
 mode = GAMEOVER;
 }
 }
 } */
