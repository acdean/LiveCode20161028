import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

import processing.opengl.*;
import com.jogamp.opengl.*;  // new jogl - 3.0b7

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
  // PJOGL 2.2.1, 30b7
  GL gl = ((PJOGL)beginPGL()).gl.getGL();
  // additive blending
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
  gl.glDisable(GL.GL_DEPTH_TEST);
  lights();
  background(frameCount % 360, 25, 25);
  colorMode(RGB);
  noFill();
  for (Bauble b : baubles) {
    b.draw();
  }
}

class Bauble {
  float rx, dx, ry, dy, rz, dz; // rotation
  float x, y, z; //pos

  Bauble() {
    dx = random(-.02, .02);
    dy = random(-.02, .02);
    dz = random(-.02, .02);
    x = random(-width, width);
    y = random(-height, height);
    z = random(-500, 500);
  }

  void draw() {
    pushMatrix();
    translate(x, y, z);
    rx += dx;
    ry += dy;
    rz += dz;
    scale(50);
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