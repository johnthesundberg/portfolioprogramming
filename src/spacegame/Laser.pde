class Laser {
  int x, y, w, speed;
  PImage laser;
  
  Laser(int x, int y, int w) {
    this.w = w;

    this.x = x;
    this.y = y;

    speed = 6;
    laser = loadImage("laser.png");
  }
  void display() {
    rectMode(CENTER);
    laser.resize(w,w);
    imageMode(CENTER);
    image(laser,x,y);
  }
  void move() {
    y = y - speed;

  }
  boolean reachedTop() {
    if (y < -50) {
      return true;
    }
    else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x,rock.y);
    if(d < w/2+rock.diam/10){
    return true;
    }
    else {
    return false;
  }
  }
}
