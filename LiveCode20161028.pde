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
  colorMode(HSB, 360, 0, 0);
  background(frameCount % 360, 100, 100);
}