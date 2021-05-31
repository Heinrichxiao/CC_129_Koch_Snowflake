void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

class Flake {
  ArrayList<Segment> segments;
  PVector pos;
  float heading;
  float headingV;
  int quality;
  int mq;
  float size;

  Flake(PVector pos_, float size_) {
    heading = 0;
    quality = 0;
    mq = floor(random(1, 3));
    size = size_;
    headingV = random(-0.1, 0.1);
    segments = new ArrayList<Segment>();
    PVector a = new PVector(0, 100);
    PVector b = new PVector(600, 100);
    Segment s1 = new Segment(a, b);

    float len = PVector.dist(a, b);
    float h = len * sqrt(3) / 2;
    PVector c = new PVector(300, 100+h);

    Segment s2 = new Segment(b, c);
    Segment s3 = new Segment(c, a);
    segments.add(s1);
    segments.add(s2);
    segments.add(s3);
    pos = pos_;
  }

  void update() {
    if (quality <= mq) {
      ArrayList<Segment> nextGeneration = new ArrayList<Segment>();

      for (Segment s : segments) {
        Segment[] children = s.generate();
        addAll(children, nextGeneration);
      }
      segments = nextGeneration;
      quality += 1;
    }
    heading += headingV;
    pos.y += 5;
  }

  void show() {
    push();
    beginShape();
    fill(255, 225);
    scale(size);
    translate(pos.x * (1 / size), pos.y * (1 / size));
    rotate(heading);
    stroke(255);
    for (Segment s : segments) {
      s.show();
    }
    endShape();
    pop();
  }
}
