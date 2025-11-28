int ballPoints = 0;
int ball2Points = 0;
boolean start2 = false;

void game() {
  background(blue);
  
  if (start2 == true) {
    ball2.setStatic(false);
    //display ball2 points
    fill(white);
    textSize(40);
    text(ball2Points, width/2, 70);
  } else if (start2 == false) {
    ball2.setStatic(true);
    //display ball points
    fill(white);
    textSize(40);
    text(ballPoints, width/2, 70);
  }


  //ball actions
  if (ball.isTouchingBody(endSpot)) {
    ball.removeFromWorld();
    start2 = true;
  }
  if (ball2.isTouchingBody(endSpot)) {
    ball2.removeFromWorld();
    mode = GAMEOVER;
  }

  if (mousePressed && start2 == false) {
    ballPoints++;
    float vx = mouseX - ball.getX();
    float vy = mouseY - ball.getY();
    ball.setVelocity(vx, vy);
  } else if (mousePressed && start2 == true) {
    ball2Points++;
    float vx = mouseX - ball2.getX();
    float vy = mouseY - ball2.getY();
    ball2.setVelocity(vx, vy);
  }

  //ball out of frame
  if (ball.getX() > width || ball.getX() < 0) {
    ballPoints = ballPoints + 1000;
    ball.removeFromWorld();
    start2 = true;
  }
  if (ball2.getX() > width || ball2.getX() < 0) {
    ball2Points = ball2Points + 1000;
    ball2.removeFromWorld();
    mode = GAMEOVER;
  }

  if (mode == GAMEOVER) {
    endSpot.removeFromWorld();
    ssand.removeFromWorld();
  }

  world.step();
  world.draw();
}
