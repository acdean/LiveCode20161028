import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

void setup() {
  size(1000, 600, OPENGL);
  cam = new PeasyCam(this, 500);
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(frameCount % 360, 100, 100);
  colorMode(RGB);
  noFill();
  scale(50);
  rotateX(radians(frameCount / 8.0));
  rotateY(radians(frameCount / 51.0));
  stroke(255, 0, 0);
  box(1, 3, 5);
  stroke(0, 255, 0);
  box(3, 5, 1);
  stroke(0, 0, 255);
  box(5, 1, 3);
}