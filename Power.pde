class Power {
  int x, y, diam, speed, thing;
  PImage rock;
  
  Power() {
    
    x = int(random(width));
    y = -50;
    diam = 55;
    speed = int(random(2,6));
    thing = int(random(5));
//    thing = 1;
    if (thing == 1) {
    rock = loadImage("tomatopower.png");
    }
    else if (thing == 2) {
    rock = loadImage("ammopower.png");
    } else if (thing == 3) {
    rock = loadImage("shieldpower.png");
    } else {
    rock = loadImage("healthpower.png");
    }
  }
  void display() {
    rock.resize(diam,diam);
    imageMode(CENTER);
    image(rock,x,y);
  }
  void move() {
    y = y + speed;
  }
  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    }
    else {
      return false;
    }
  }
  boolean intersect(SpaceShip spaceship) {
    float d = dist(x,y,spaceship.x,spaceship.y);
    if(d < diam/2+spaceship.w/10){
    return true;
    }
    else {
    return false;
  }
  }
}
