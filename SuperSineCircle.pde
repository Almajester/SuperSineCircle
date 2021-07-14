/**
 * SuperSineCircle.pde -- from a demo program shown on Numberphile
 * A. Thall
 * 7/13/21
 */
 
import java.util.ArrayList;

float p;
int numDisks;
float diskR = 20;
float rotVel = PI/80;

ArrayList<Float> angles;

void setup() {
   size(768, 768);
   p = 0;
   numDisks = 2;
   angles = new ArrayList<Float>();
   setAngles(angles, numDisks);
}

void setAngles(ArrayList<Float> a, int num) {
  a.clear();
  float theta = PI/num;
  for (int i = 0; i < num; i++) {
    a.add(i*theta);
  }
}

void draw() {
  background(0, 256, 256);
  fill(0, 0, 0);
  strokeWeight(2);
  rect(10, 10, width - 20, height - 20);
  p += rotVel;
  stroke(255);
  ellipseMode(RADIUS);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, width/2.3, height/2.3);
  colorMode(HSB);
  noStroke();
  for (float theta: angles) {
    float frac = sin(theta + p);
    float center = frac*width/2.5;
    float hue = ((frac + 1)/2)*255;
    fill(color(hue, 255, 255));
    pushMatrix();
    rotate(theta);
    translate(center, 0);
    ellipse(0, 0, diskR, diskR);
    popMatrix();
  }
  popMatrix();
  colorMode(RGB);
  stroke(255);
}

void keyPressed() {
   if (key == '+' && numDisks < 30) {
     numDisks += 1;
     setAngles(angles, numDisks);
   }
   else if (key == '-' && numDisks > 2) {
     numDisks -= 1;
     setAngles(angles, numDisks);
   }
}
  
