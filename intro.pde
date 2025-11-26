button startButton;


void intro() {
  background(blue);

  //game title
  fill(white);
  textSize(90);
  text("golf", width/2, 200);

  //start button
  startButton = new button("start", width/2, 400, 150, 70, white, blue);
  click();
  startButton.show();
  introClicks();


}

void introClicks() {
  if (startButton.clicked) {
    mode = GAME1;
  }
}
