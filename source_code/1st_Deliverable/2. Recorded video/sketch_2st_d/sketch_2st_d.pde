import processing.video.*;
Movie myMovie;

void setup() {
  size(500, 500);
  frameRate(40);
  myMovie = new Movie(this, "night.city.mp4");
  myMovie.speed(4.0);
  myMovie.loop();
}

void draw() {
  float r = map(mouseX,0,width,0,4);
  myMovie.speed(r);
  if (myMovie.available()) {
    myMovie.read();
  }
  image(myMovie, 0, 0);
}
