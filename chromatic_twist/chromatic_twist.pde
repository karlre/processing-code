void setup() {
  size(600, 600);
  smooth(8);
  noStroke();
}

float start = 0;

void draw() {
  background(160, 130, 75);
  fill(235, 203, 2);
  ellipse(width/2, height/2, width - 50, height - 50);
  fill(215, 130, 2);
  ellipse(width/2, height/2, width - 130, height - 130);
  fill(190, 70, 10);
  ellipse(width/2, height/2, width - 210, height - 210);
  fill(165, 30, 20);
  ellipse(width/2, height/2, width - 290, height - 290);
  fill(85, 65, 125);
  ellipse(width/2, height/2, width - 370, height - 370);

  pushMatrix();
  translate(width/2, height/2);
  float time = map(cos(frameCount*0.005), -1, 1, 1, 0);
  float trot =  ease(time, 8);
  float rot = map(trot, 0, 1, 0, 2*TWO_PI);
  rotate(rot);
  fill(45, 55, 140);
  arc(0, 0, width - 50, height - 50, 5*PI/4, 7*PI/4);
  arc(0, 0, width - 50, height - 50, HALF_PI/2, PI/4 * 3);

  fill(58, 80, 185);
  arc(0, 0, width - 130, height - 130, 5*PI/4, 7*PI/4);
  arc(0, 0, width - 130, height - 130, HALF_PI/2, PI/4 * 3);

  fill(65, 110, 145);
  arc(0, 0, width - 210, height - 210, 5*PI/4, 7*PI/4);
  arc(0, 0, width - 210, height - 210, HALF_PI/2, PI/4 * 3);

  fill(105, 160, 140);
  arc(0, 0, width - 290, height - 290, 5*PI/4, 7*PI/4);
  arc(0, 0, width - 290, height - 290, HALF_PI/2, PI/4 * 3);

  fill(130, 170, 60);
  arc(0, 0, width - 370, height - 370, 5*PI/4, 7*PI/4);
  arc(0, 0, width - 370, height - 370, HALF_PI/2, PI/4 * 3);


  fill(45, 50, 125);
  ellipse(0, 0, width - 450, height - 450);

  fill(237, 202, 0);
  float x1 = 75 * cos(radians(-135));
  float y1 = 75 * sin(radians(-135));
  float x2 = 75 * cos(radians(-45));
  float y2 = 75 * sin(radians(-45));
  //arc(width/2, height/2 , width - 530, height - 530, 5*PI/4, 7*PI/4);
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
  //arc(width/2, height/2 , width - 530, height - 530, 5*PI/4, 7*PI/4);
  bezier(x1, y1, -10, 10, 10, 10, x2, y2);
  bezier(x1, y1, -25, 83, 25, 83, x2, y2);
  stroke(237, 202, 0);
  strokeWeight(2);
  line(x1+2, y1, x2-2, y2);
  noStroke();
  popMatrix();
 // saveFrame("f###.gif");
  println(trot);
  if(trot >= 1) {
    exit();
  }
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}