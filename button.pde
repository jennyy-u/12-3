class button {

  //instance variables
  int x, y, w, h; //x, y is the center
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;

  //constructor -> setup for the object
  button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x; //differentiate name from instance variable
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  button(PImage pic, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x; //differentiate name from instance variable
    y = _y;
    w = _w;
    h = _h;
    img = pic;
    highlight = high;
    normal = norm;
    clicked = false;
    text = "";
  }

  //behaviour functions


  void show() {

    drawRect();
    drawLabel();
    checkForClick();
  }


  void drawRect() {
    rectMode(CENTER);
    if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(3);
    rect(x, y, w, h, 20);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
    if (img == null) {
      textSize(w/4);
      text(text, x, y);
    } else if (img != null) {
      image(img, x, y, w*0.9, h*0.9);
    }
  }

  void checkForClick() {
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }


  boolean touchingMouse() {
    //return true if mouse is touching the button
    return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }
}


void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
