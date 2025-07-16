
// キャラクタークラス
class character {
  int x, y;

  character() {
    x = width / 2;
    y = height - 60;
  }

  void display() {
    fill(0, 102, 255);
    textSize(48);
    textAlign(CENTER, CENTER);
    text("main", x, y);
  }

  void move(int code) {
    if (code == LEFT) {
      x -= 20;
    } else if (code == RIGHT) {
      x += 20;
    }
    x = constrain(x, 50, width - 50);
  }
}
