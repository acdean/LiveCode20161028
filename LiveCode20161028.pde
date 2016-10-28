import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;
ArrayList<Bauble> baubles = new ArrayList<Bauble>();

void setup() {
  size(1000, 600, OPENGL);
  cam = new PeasyCam(this, 500);
  for (int f = 0 ; f < 50 ; f++) {
    baubles.add(new Bauble());
  }
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(frameCount % 360, 100, 100);
  colorMode(RGB);
  for (Bauble b : baubles) {
    b.draw();
  }
}

class Bauble {
  float rx, dx, ry, dy, rz, dz;

  Bauble() {
    dx = random(-.02, .02);
    dy = random(-.02, .02);
    dz = random(-.02, .02);
  }

  void draw() {
    pushMatrix();
    rx += dx;
    ry += dy;
    rz += dz;
    scale(5);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    stroke(255, 0, 0);
    box(1, 3, 5);
    stroke(0, 255, 0);
    box(3, 5, 1);
    stroke(0, 0, 255);
    box(5, 1, 3);
    popMatrix();
  }
}