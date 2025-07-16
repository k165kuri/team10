class gomi2 extends Gomi {
PImage gomi_i;
  
  gomi2(){
    super();
    gomi_i = loadImage("piano.png");
  }
  
  void display(){
    image(gomi_i,position_x,position_y,30,30);
    position_y = position_y - 3;
  }
}
