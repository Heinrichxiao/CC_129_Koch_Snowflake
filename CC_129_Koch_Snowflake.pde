// Coding Challenge 129: Koch Snowflake
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/129-koch-snowflake.html
// https://youtu.be/X8bXDKqMsXE
// https://editor.p5js.org/codingtrain/sketches/SJHcVCAgN

//ArrayList<Segment> segments;

//int flakew = round(sqrt(3) / 2) * 600;
ArrayList<Flake> flakes;


void setup() {
  //size(600, flakew);
  fullScreen();
  flakes = new ArrayList<Flake>();
  //segments = new ArrayList<Segment>();
  //PVector a = new PVector(0, 100);
  //PVector b = new PVector(600, 100);
  //Segment s1 = new Segment(a, b);

  //float len = PVector.dist(a, b);
  //float h = len * sqrt(3) / 2;
  //PVector c = new PVector(300, 100+h);
  
  //Segment s2 = new Segment(b, c);
  //Segment s3 = new Segment(c, a);
  //segments.add(s1);
  //segments.add(s2);
  //segments.add(s3);
  
  //for (int i = 0; i < 100; i++) {
  //  addFlake();
  //}

  ////println(children);
  //Flake newFlake = new Flake(new PVector());
  //println(flakes.add(newFlake));
  //println(flakes);
}


void draw() {
  background(0);
  //translate(0, 100);

  stroke(255);
  int index = 0;
  for (Flake f : flakes) {
    f.show();
    f.update();
    //if (f.pos.y >= height) {
    //  flakes.remove(f);
    //}
    index++;
  }
  
  if (random(1) < 1) {
    for (int i = 0; i < 1; i++) {
      addFlake(true);
    }
  }
}

void addFlake() {
  flakes.add(new Flake(new PVector(random(width), random(height)), random(0.025, 0.1)));  
}

void addFlake(boolean b) {
  flakes.add(new Flake(new PVector(random(width), 0), random(0.025, 0.1)));
}
