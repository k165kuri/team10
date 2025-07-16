class gomi1 extends gomi {
PImage gomi_i;
  
  gomi1(){
    super();
    speed = (int)random(3);
    gomi_i = loadImage("drm.png");
  }
  
  void display(){
    image(gomi_i,position_x,position_y,60,60);
    position_y = position_y + 4 + speed;
  }
}
