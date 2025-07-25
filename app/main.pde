import ddf.minim.*;

Gamecharacter mainChar;
PImage imgFront, imgLeft, imgRight;
boolean dash = false;
ArrayList<gomi1> gomi1s;
ArrayList<gomi2> gomi2s;

int score = 0;
int startTime;
boolean gameOver = false;


int lastKey = 0;
int lastKeyTime = 0;
int doubleTapThreshold = 300;
Minim minim;
AudioPlayer bgm;


PFont font;
void setup() {
  size(800, 600);
  font = createFont("SansSerif", 20); 
  textFont(font);
  imgFront = loadImage("character.png");         
  imgLeft = loadImage("character_left.png");    
  imgRight = loadImage("character_right.png");  
  
  minim = new Minim(this);
  bgm = minim.loadFile("bgm.mp3");
  bgm.loop();

  mainChar = new Gamecharacter(imgFront); 
 
  gomi1s = new ArrayList<gomi1>();
  gomi2s = new ArrayList<gomi2>();

  startTime = millis();
}

void draw() {
  background(40, 224, 208);

  if (!gameOver) {
    // キャラクター描画
    mainChar.display();

    // gomi1s 処理
    for (int i = gomi1s.size() - 1; i >= 0; i--) {
      gomi1 g1 = gomi1s.get(i);
      g1.display();
      if (g1.hit(mainChar)) {
        gameOver = true;
      } else if (g1.position_y > height+30) {
        gomi1s.remove(i);
        score += 2;
      }
    }

    // gomi2s 処理
    for (int i = gomi2s.size() - 1; i >= 0; i--) {
      gomi2 g2 = gomi2s.get(i);
      g2.display();
      if (g2.hit(mainChar)) {
        gameOver = true;
      } else if (g2.position_y > height+30) {
        gomi2s.remove(i);
        score += 3;
      }
    }

    // 定期的にゴミを追加
    if (frameCount % 60 == 0) {
      gomi1s.add(new gomi1());
      gomi2s.add(new gomi2());
    }
    if (frameCount % 120 == 0) {
      gomi1s.add(new gomi1());
    }
    if (frameCount % 180 == 0) {
      gomi2s.add(new gomi2());
    }
    if(score > 100){
      if (frameCount % 45 == 0) {
      gomi2s.add(new gomi2());
      }
      if (frameCount % 35 == 0) {
      gomi1s.add(new gomi1());
      }
    }

    // スコアと時間の表示
    fill(0);
    textSize(20);
    text("スコア: " + score, 10, 30);
    int elapsed = (millis() - startTime) / 1000;
    text("経過時間: " + elapsed + " 秒", 10, 60);

  } else {
    // ゲームオーバー画面
    fill(255, 0, 0);
    textSize(40);
    text("Game Over", width/2 - 100, height/2);
    textSize(20);
    text("スコア: " + score, width/2 - 30, height/2 + 40);
    text("Rキーで再スタート", width/2 - 60, height/2 + 80);
  }
}

void keyPressed() {
  if (gameOver && key == 'r') {
    resetGame();
    return;
  }
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

 

void resetGame() {

  gomi1s.clear();
  gomi2s.clear();
  score = 0;
  startTime = millis();
  mainChar = new Gamecharacter(loadImage("character.png"));
  gameOver = false;
}
