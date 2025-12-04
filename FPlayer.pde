class FPlayer extends FGameObject {

  int frame;

  FPlayer() {
    super();
    frame = 0;
    setPosition(150, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }

  void act() {
    input();
    collisions();
    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(action[frame]);
      frame++;
    }
  }

  void input() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (abs(vy) < 0.1) { //absolute value
      action = idle;
    }
    if (akey) {
      setVelocity(-200, vy);
      action = run;
    }
    if (dkey) {
      setVelocity(200, vy);
      action = run;
    }
    if (wkey) setVelocity(vx, -200);
    if (skey) setVelocity(vx, 200);
    if (abs(vy) > 0.1) {
      action = jump;
    }
  }

  void collisions() {
    if (isTouching("spike")) {
      setPosition(150, 0);
    }
  }
}
