class gomi1 extends Gomi {
PImage gomi_i;
  
  gomi1(){
    super();
    gomi_i = loadImage("drm.png");
  }
  
  void display(){
    image(gomi_i,position_x,position_y,30,30);
    position_y = position_y - 3;
  }
}
