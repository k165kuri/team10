

// キャラクタークラス
class Gamecharacter {
  int x, y;
  PImage img;

  Gamecharacter(PImage img) {
    this.img = img;
    x = width / 2;
    y = height - 60;
  }

  void display() {
    imageMode(CENTER);
    image(img, x, y, 90, 90);
  }

  void move(int code, boolean dash) {
    int speed = dash ? 80 : 10;

    if (code == LEFT) {
      x -= speed;
    } else if (code == RIGHT) {
      x += speed;
    }
    x = constrain(x, 50, width - 50);
  }
}
