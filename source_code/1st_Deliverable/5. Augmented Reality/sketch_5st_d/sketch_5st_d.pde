import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
PImage img;

void setup() {
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"../sketch_5st_d/data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("../sketch_5st_d/data/patt.hiro",80);
  cam.start();
   img = loadImage("illusion3.jpg");
}

void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  
  nya.drawBackground(cam);
  if((!nya.isExist(0))){
    return;
  }
  nya.beginTransform(0);
  fill(0,0,255);
  translate(10,10,5);
   image(img, 0, 0);
  nya.endTransform();
}
