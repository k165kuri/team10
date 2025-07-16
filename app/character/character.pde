Gamecharacter mainChar;
PImage obj;

int lastKey = 0;
int lastKeyTime = 0;
int doubleTapThreshold = 300;

void setup() {
  size(800, 600);
  obj = loadImage("character.png"); 
  mainChar = new Gamecharacter(obj);
}

void draw() {
  background(240);
  mainChar.display();
}

void keyPressed() {
  int currentTime = millis();

  if (keyCode == lastKey && currentTime - lastKeyTime < doubleTapThreshold) {
    mainChar.move(keyCode, true);
  } else {
    mainChar.move(keyCode, false);
  }

  lastKey = keyCode;
  lastKeyTime = currentTime;
}

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
