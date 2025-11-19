PVector loca;


void game() {




  background(blue);

  if (ball.isTouchingBody(endSpot)) {
    mode = GAMEOVER;
  }


  world.step();
  world.draw();
}

void moveBall() {
  ballClick();
}

void ballClick() {
  if (mousePressed) {
    
    
  }
}
