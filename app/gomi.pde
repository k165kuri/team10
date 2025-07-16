class Gomi{
  int position_x,position_y;

  Gomi() {
    position_x = (int)random(width);
    position_y = height;
  }

  void display() {
  }

  boolean hit(Gamecharacter c) {
    if (position_x < c.x + 30 &&
      position_x + 30 > c.x &&
      position_y < c.y + 30 &&
      position_y + 30 > c.y) {
    return true;
  }
  return false;
}
}
