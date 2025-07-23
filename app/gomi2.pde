class gomi2 extends gomi {
PImage gomi_i;
  
  gomi2(){
    super();
    speed = (int)random(6);
    gomi_i = loadImage("piano.png");
  }
  
  void display(){
    image(gomi_i,position_x,position_y,60,60);
    position_y = position_y + 3 + speed;
  }
}
