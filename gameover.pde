button playAgainButton;

void gameover() {
  background(blue);

  //game title
  fill(white);
  textSize(70);
  text("gameover", width/2, 250);

  //show score
  textSize(30);
  text("player 1 score:", 465, 370);
  text(ballPoints, 590, 370);
  text("player 2 score:", 465, 400);
  text(ball2Points, 590, 400);

  //show win
  if (ballPoints < ball2Points) {
    textSize(50);
    text("PLAYER 1 WINS", width/2, 120);
  } else if (ball2Points < ballPoints) {
    textSize(50);
    text("PLAYER 2 WINS", width/2, 120);
  }

  playAgainButton = new button("restart", width/2, 500, 150, 70, white, blue);
  click();
  playAgainButton.show();
  gameoverClicks();
}

void gameoverClicks() {
  if (playAgainButton.clicked) {
    mode = GAME;
    start2 = false;
    makeBall2();
    makeBall();
    ballPoints = 0;
    ball2Points = 0;
    makeEndSpot();
    makeSand();
  }
}
