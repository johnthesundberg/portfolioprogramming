class Rock {
  int x, y, diam, speed;
  PImage rock;
  boolean laser;
  
  Rock(boolean isproj, int bossx) {
    if(isproj) {
    laser = true;
    x = bossx;
    y = 50;
    diam = 50;
    speed = 6;
    rock = loadImage("laser.png");
    } else {
    laser = false;
    x = int(random(width));
    y = -50;
    diam = int(random(100,200));
    speed = int(random(2,4));
    if (int(random(1,3)) == 1) {
    rock = loadImage("rock.png");
    }
    else {
    rock = loadImage("rock2.png");
    }
  }}
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


}
