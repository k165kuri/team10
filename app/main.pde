import ddf.minim.*;

Minim minim;
AudioPlayer bgm;
AudioSample se_hit;

character player;
ArrayList<Gomi> gomis;
ArrayList<Gomi1> gomis1;

int score = 0;
int startTime;
boolean gameOver = false;

void setup() {
  size(400, 600);
  player = new character();
  gomis = new ArrayList<Gomi>();
  gomis1 = new ArrayList<Gomi1>();
  
  minim = new Minim(this);
  bgm = minim.loadFile("bgm.mp3");
  se_hit = minim.loadSample("se_hit.wav");
  bgm.loop();
  
  startTime = millis();
}

void draw() {
  background(200);

  if (!gameOver) {
    // キャラクターの表示・更新
    player.update();
    player.display();

    // ゴミの生成
    if (frameCount % 60 == 0) {
      gomis.add(new Gomi());
    }
    if (frameCount % 90 == 0) {
      gomis1.add(new Gomi1());
    }

    
    // 時間とスコア表示
    fill(0);
    textSize(16);
    text("スコア: " + score, 10, 20);
    int elapsed = (millis() - startTime) / 1000;
    text("時間: " + elapsed + " 秒", 10, 40);
  } else {
    textSize(32);
    fill(255, 0, 0);
    text("Game Over", width/2 - 100, height/2);
    textSize(20);
    text("スコア: " + score, width/2 - 40, height/2 + 40);
  }
}

void keyPressed() {
  player.keyPressed();
}
