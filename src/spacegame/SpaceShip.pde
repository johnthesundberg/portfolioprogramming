class SpaceShip {
  int x, y, w, turretCount, ammo, health;
  PImage ship;

  //Constructor
  SpaceShip() {
    turretCount = 1;
    ammo = 500;
    health = 1000;
    x = 0;
    y = 0;
    w = 90;
    
}
  void display(boolean isShield) {
    if(isShield){
      ship = loadImage("shipShield.png");
    } else {
    ship = loadImage("ship.png");
    }
    noCursor();
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move(int tempx, int tempy) {
    x =  tempx;
    y = tempy;
  }
  boolean fire() {
    if (ammo > 0) {
      ammo --;
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x,rock.y);
    if(d < 50+rock.diam/10){
    return true;
    }
    else {
    return false;
  }
}}
