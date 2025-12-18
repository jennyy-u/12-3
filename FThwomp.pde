class FThwomp extends FGameObject {


  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
  }


  void act() {
    attachImage(thwomp[0]);
    turnOn();

    if (isTouching("player")) {
      player.lives--;
      player.setPosition(150, 0);
    }
  }

  void turnOn() {
    if (player.x == thwomp.x) {
      attachImage(thwomp[1]);
      setStatic(false);
    }
  }
}
