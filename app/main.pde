import ddf.minim.*;

Minim minim;
AudioPlayer bgm;
AudioSample se_hit;

Charactor player;
ArrayList<Gomi> gomis;
ArrayList<Gomi1> gomis1;

int score = 0;
int startTime;
boolean gameOver = false;

void setup() {
  size(400, 600);
  player = new Charactor();
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

    // ゴミの動作
    for (int i = gomis.size() - 1; i >= 0; i--) {
      Gomi g = gomis.get(i);
      g.update();
      g.display();
      if (g.hits(player)) {
        gameOver = true;
        se_hit.trigger();
        bgm.close();
      } else if (g.y > height) {
        gomis.remove(i);
        score++;
      }
    }

    for (int i = gomis1.size() - 1; i >= 0; i--) {
      Gomi1 g1 = gomis1.get(i);
      g1.update();
      g1.display();
      if (g1.hits(player)) {
        gameOver = true;
        se_hit.trigger();
        bgm.close();
      } else if (g1.y > height) {
        gomis1.remove(i);
        score += 2;
      }
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
