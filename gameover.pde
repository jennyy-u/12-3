button playAgainButton;

void gameover() {
  background(blue);

  //game title
  fill(white);
  textSize(70);
  text("gameover", width/2, 200);
  
  //player1 win
  
  //player2 win


  playAgainButton = new button("restart", width/2, 400, 150, 70, white, blue);
  click();
  playAgainButton.show();
  gameoverClicks();
}

void gameoverClicks() {
  if (playAgainButton.clicked) {
    mode = INTRO;
    ball.setPosition(20, 0);
    ball = new FCircle(30);
    endSpot.setPosition(957, 0);
    endSpot = new FBox(35, 10);
  }
}
