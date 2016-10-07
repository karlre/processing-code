PVector[] boxes;
int box_width = 100;
int box_height = 15;
int r;

void setup() {
  size(800, 600);
  stroke(51);
  fill(51);
  int total_points = 20;
  float theta = TWO_PI / total_points;
  r = 50;
  boxes = new PVector[total_points];
  for (int i =0; i < total_points; i++) {
    float angle = theta * i;
    float x = r * cos(angle) + width/2;
    float y = r * sin(angle) + height/2;
    boxes[i] = new PVector(x, y);
  }
}


void draw() {
  background(255, 250, 245);
  int r2 = 60;
  float x = r2 * cos(frameCount * 0.02) + width/2;
  float y = r2 * sin(frameCount * 0.02) + height/2;
  for (int i = 0; i < boxes.length; i++) {
    pushMatrix();
    translate(boxes[i].x, boxes[i].y);
    float angle = atan2(boxes[i].y - y, boxes[i].x - x);
    //rotate(angle*(i+1)*0.05+PI);
    rotate(angle);
    line(box_width, -box_height/2, 0, 0);
    ellipse(box_width, -box_height/2, 20, 20);
    popMatrix();
  }
}