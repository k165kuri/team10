class gomi{
  int position_x,position_y,speed;

  gomi() {
    position_x = (int)random(width);
    position_y = 0;
  }

  void display() {
  }

  boolean hit(Gamecharacter c) {
    if (position_x < c.x + 50 && position_x + 50 > c.x && 
            position_y < c.y + 50 && position_y + 50 > c.y) {

    return true;
  }
  return false;
}
}
