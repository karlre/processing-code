PVector[] boxes;
int box_width = 34;
int box_height = 10;

void setup() {
  size(800, 600);
  fill(255, 0, 150, 100);
  //stroke(51);
  noStroke();
  int total_points = 100;
  float theta = TWO_PI / total_points;
  int r = 71;
  boxes = new PVector[total_points];
  for (int i =0; i < total_points; i++) {
    float angle = theta * i;
    float x = r * cos(angle);
    float y = r * sin(angle);
    boxes[i] = new PVector(x, y);
  }
}

void draw() {
  background(255, 250, 245);
  for (int y = -1; y < 11; y++) {
    for (int x = -1; x < 11; x++) {
      beginShape();
      for (int i = 0; i < boxes.length; i++) {
        pushMatrix();
        float bx = boxes[i].x + x * 100;
        float by = boxes[i].y + y * 100;
        translate(bx, by);
        float angle = atan2(by - height/2, bx - width/2);
        rotate(angle+frameCount*0.1);
        float sx = screenX(box_width, box_height);
        float sy = screenY(box_width, box_height);
        vertex(sx, sy);
        popMatrix();
      }
      endShape(CLOSE);
    }
  }
}