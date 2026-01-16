class FNpc extends FGameObject {

  FNpc() {
    super();
    attachImage(npcImg);
    setName("npc");
    setRotatable(false);
  }
  
  //npc modes
  final int WAITING = 0;
  final int INTERACT = 1;
  final int RESET = 2;
  int mode = WAITING;
  
 
  
  void act() {
    if (mode == WAITING) waiting();
    else if (mode == INTERACT) interact();
    else if (mode == RESET) reset();

  }

  void waiting() {
    setStatic(true);
    if (player.getX() > getX() || player.getX() < getX()-2*gridSize &&
      player.getY() == getY()) {
      mode = INTERACT;
    }
  }

  void interact() {
    text("get this potion for me", width/2, 170);
    
  }
  
  void reset() {
    
  }
}
