/*
Fbox leftPlayer, rightPlayer;
 
 
 left.Player...;
 world.add(leftPlayer);
 
 
 in draw function,
 
 void handlePlayerInput() {
 float left_vx = leftPlayer.getVelocityX();
 float left_vy = leftPlayer.getVelocityY();
 
 
 }
 
 if (wKey)
 leftPlayer.setVelocity(left_vx, -500);
 
 if (aKey)
 leftPlayer.setVelocity(-500, left_vx);
 
 
 if (hitGround(leftGround)) {
   rightScore++; //right side player gets a score
   reset(LEFT);
 }
if (hitGround(rightGround)) {
   leftScore++;
   reset(RIGHT);
 }
 
contact
 int i = 0;
 while (i < contactList.size()) {
   Fcontact myContact = contactList.get(i);
   if (myContact.contains(ground))
   return true;
   i++;
 }
 return false;
 }
 
 
 */
