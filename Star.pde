class Star {
  int x, y, diam, speed;
  Star() {
  x = int(random(width));
  y = int(random(height));
  diam = int(random(1,5));
  speed = diam;
  
  
    
  }
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x,y,diam/2,diam/2);
    fill(255,127);
    rect(x,y,diam,diam);
  }
  void move() {
    if (y>height+5) {
      y =  - 5;
    }
    else {
      y += speed;
    }
  }
  boolean reachedBottom() {
    return false;
  }
}
