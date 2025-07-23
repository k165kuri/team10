Gamecharacter mainChar;
PImage imgFront, imgLeft, imgRight;

boolean dash = false;

void setup() {
  size(800, 600);

  imgFront = loadImage("character.png");         
  imgLeft = loadImage("character_left.png");    
  imgRight = loadImage("character_right.png");  

  mainChar = new Gamecharacter(imgFront); 
}

void draw() {
  background(240);
  mainChar.display();
}

void keyPressed() {
  if (key == 'v' || key == 'V') {
    dash = true;
  }

  if (keyCode == LEFT) {
    mainChar.setImage(imgLeft); 
    mainChar.move(LEFT, dash);
  } else if (keyCode == RIGHT) {
    mainChar.setImage(imgRight); 
    mainChar.move(RIGHT, dash);
  }
}

void keyReleased() {
  if (key == 'v' || key == 'V') {
    dash = false;
  }

}

class Gamecharacter {
  int x, y;
  PImage img;

  Gamecharacter(PImage img) {
    this.img = img;
    x = width / 2;
    y = height - 60;
  }

  void setImage(PImage newImg) {
    this.img = newImg;
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
