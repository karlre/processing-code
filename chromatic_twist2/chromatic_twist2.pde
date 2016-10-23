color[] bg = {color(235, 203, 2), color(215, 130, 2), color(190, 70, 10), color(165, 30, 20), color(85, 65, 125), color(45, 50, 125)};
color[] fg = {color(45, 55, 140), color(58, 80, 185), color(65, 110, 145), color(105, 160, 140), color(130, 170, 60), color(237, 202, 0)};


void setup() {
  size(600, 600);
  noStroke();
  smooth();
}

float start = 0;

void draw() {
  background(160, 130, 75);
  float time = map(cos(frameCount*0.005), -1, 1, 1, 0);
  float trot =  ease(time, 8);
  for (int i = 0; i < 5; i++) {

    fill(bg[i]);
    ellipse(width/2, height/2, width - (width/12 + i * width/7.5), height - (height/12 + i * height/7.5));

    pushMatrix();
    translate(width/2, height/2);
    float rot = map(trot, 0, 1, 0, (i+1)*TWO_PI);
    rotate(rot);
    fill(fg[i]);
    arc(0, 0, width - (width/12 + i * width/7.5), height - (height/12 + i * height/7.5), 5*PI/4, 7*PI/4);
    arc(0, 0, width - (width/12 + i * width/7.5), height - (height/12 + i * height/7.5), HALF_PI/2, PI/4 * 3);
    noStroke();
    popMatrix();
  };

  pushMatrix();
  translate(width/2, height/2);
  float rot = map(trot, 0, 1, 0, 6*TWO_PI);
  rotate(rot);

  fill(45, 50, 125);
  ellipse(0, 0, width - 450, height - 450);

  fill(237, 202, 0);
  float x1 = 75 * cos(radians(-135));
  float y1 = 75 * sin(radians(-135));
  float x2 = 75 * cos(radians(-45));
  float y2 = 75 * sin(radians(-45));
  bezier(x1, y1, -10, -10, 10, -10, x2, y2);
  bezier(x1, y1, -25, -83, 25, -83, x2, y2);
  stroke(237, 202, 0);
  strokeWeight(2);
  line(x1+2, y1, x2-2, y2);
  noStroke();

  x1 = 75 * cos(radians(135));
  y1 = 75 * sin(radians(135));
  x2 = 75 * cos(radians(45));
  y2 = 75 * sin(radians(45));
  bezier(x1, y1, -10, 10, 10, 10, x2, y2);
  bezier(x1, y1, -25, 83, 25, 83, x2, y2);
  stroke(237, 202, 0);
  strokeWeight(2);
  line(x1+2, y1, x2-2, y2);
  noStroke();
  popMatrix();
  //saveFrame("f###.gif");
  if (trot >= 1) {
    //   exit();
  }
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}