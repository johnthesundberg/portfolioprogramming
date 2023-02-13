// John Sundberg | 28 Nov 2022 | SpaceGame
import processing.sound.*;
SoundFile tomatoSound, explosion, explosion1, sadviolin;

SpaceShip USSRobert;
Timer rockTimer, powerTimer, shieldTimer, turretTimer, levelTimer, tomatoTimer;

ArrayList<Power> powers = new ArrayList<Power>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[700];
int score, rockCount, laserCount, level, bossy, bossx, bossh;



PImage boss;
boolean play;

void setup() {
  tomatoSound = new SoundFile(this, "blaster.wav");
  explosion = new SoundFile(this, "explosion.wav");
  explosion1 = new SoundFile(this, "explosion1.wav");  
  sadviolin = new SoundFile(this, "sadviolin.wav");  
  play = false;
  //fullScreen(); 
  frameRate(80);
  size(800, 800);
  USSRobert = new SpaceShip();
  rockTimer = new Timer(700);
  powerTimer = new Timer(10000);
  shieldTimer = new Timer(10000);
  shieldTimer.totalTime = 0;
  turretTimer = new Timer(30000);
  levelTimer = new Timer(100000);
  tomatoTimer = new Timer(500);

  
  rockTimer.start();
  powerTimer.start();
  levelTimer.start();
  
  boss = loadImage("badSpaceShip.png");
  bossy = -100;
  bossx = width/2;
  
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  bossh = 100;
    }

void draw() {
  if(!play) {
    startScreen();
  } else {
    if (levelTimer.isFinished()) {



      if(bossy < 40 ) {
        bossh = 100;
        bossy = bossy + 1;
      } else {
        if( tomatoTimer.isFinished() ) {
        rocks.add(new Rock(true, bossx));
        tomatoTimer.start();
        }
      if(bossx < mouseX ) {
        bossx = bossx + 1;
      } else
        if(bossx > mouseX) {
          bossx = bossx - 1;
        }
      }      
    }
    if( bossh <= 0) {
      levelTimer.start();

      if(bossy > -100 ) {
        bossy = bossy - 1;
      } else {

      level ++;
        bossh = 100 * level;
        
      }
    }
    
    
  background(0);
  for (int i=0; i<stars.length; i++) {
    stars[i].display();
    stars[i].move();
  }
  if (shieldTimer.isFinished()) {
  USSRobert.display(false);
  } else {
    USSRobert.display(true);
  }
  //Asteroid.display();
  if (rockTimer.isFinished()) {
    rocks.add(new Rock(false, bossx));
    rockTimer.start();
  }
  for (int i = 0; i < rocks.size(); i++) {
    Rock r = rocks.get(i);
    if (USSRobert.intersect(r)) {
      if (shieldTimer.isFinished()) {

      USSRobert.health -= r.diam;
      if (USSRobert.health <= 0) {
        USSRobert.health = 0;
      }
      }rocks.remove(r);
    explosion1.stop();
    explosion1.play();
    }
    for (int j = 0; j < lasers.size(); j++) {
      Laser l = lasers.get(j);
      if ( l.intersect(r) ) {
        score = score + round(r.diam/5)*5;

        lasers.remove(j);
        if(int(random(130,220)) > r.diam) {
        rocks.remove(r);
        explosion1.stop();
        explosion1.play();
        } else {
          r.diam = r.diam - 20;
        explosion.stop();
        explosion.play();
        }

      }
    }
    if ( r.reachedBottom()) {
      rocks.remove(r);
      if(!r.laser) {
      score = score - (r.diam/15)*5;
      if(score <= 0 ) {
        score = 0;
      }
      }

    } else {
      r.display();
      r.move();
    }
  }

  USSRobert.move(mouseX, mouseY);

  image(boss,bossx, bossy);
  //Asteroid.move();
  infoPanel();

  if (powerTimer.isFinished()) {
    powers.add(new Power());
  shieldTimer.totalTime = 10000;
  powerTimer.totalTime = int(random(5000,20000));
  powerTimer.start();
  }

  for (int i = 0; i < powers.size(); i++) {
    Power r = powers.get(i);
    if (r.intersect(USSRobert)) {


      if (r.thing == 1) {
        USSRobert.turretCount ++;
       turretTimer.start();
       turretTimer.savedTime = millis();
     } else if (r.thing == 3) {
       shieldTimer.start(); 
      } else if (r.thing == 2) {
       USSRobert.ammo += int(random(50,100)); 

      } else {
        USSRobert.health += int(random(50,100));
        if (USSRobert.health >= 1000) {
          USSRobert.health = 1000;
        }
      }

      powers.remove(r);    }
    if (r.reachedBottom()) {
      powers.remove(r);
    } else {
      r.display();
      r.move();
    }
  }


  for (int i = 0; i < lasers.size(); i++) {
    Laser r = lasers.get(i);
    if (r.reachedTop()) {
      lasers.remove(r);
    } else if (dist(r.x, r.y,bossx, bossy) < 50) {
      lasers.remove(r);
      bossh -= 10;
      println(bossh);
    } else
    {
      r.display();
      r.move();
    }
  }
  
  if( turretTimer.isFinished() ) {
    USSRobert.turretCount = 1;
  }
  

  rectMode(CORNER);
  fill(125);

  rect(mouseX-50, mouseY +60, 100, 10);
  fill(225, 0, 0);
  rect(mouseX-50, mouseY +60, USSRobert.health/10, 10);
  
  if( USSRobert.health == 0 ) {
    gameOver();
  }

}
}
void mouseReleased() {
  if( USSRobert.ammo > 0) {
  tomatoSound.stop();
  tomatoSound.play();
  }  if (USSRobert.fire() ) {
    load();
  }
}
void keyReleased() {
  if( USSRobert.ammo > 0) {
  tomatoSound.stop();
  tomatoSound.play();
  }
  if (key == ' ') {
    if (USSRobert.fire() ) {
      load();
    }
  }
}

void load() {
  if (USSRobert.turretCount == 2) {
    lasers.add(new Laser(USSRobert.x+40, USSRobert.y-20, 40));
    lasers.add(new Laser(USSRobert.x-40, USSRobert.y-20, 40));
  } else if (USSRobert.turretCount == 3) {
    lasers.add(new Laser(USSRobert.x+40, USSRobert.y-20, 40));
    lasers.add(new Laser(USSRobert.x-40, USSRobert.y-20, 40));
    lasers.add(new Laser(USSRobert.x, USSRobert.y-40, 40));
  } else if (USSRobert.turretCount == 4) {
    lasers.add(new Laser(USSRobert.x+60, USSRobert.y-40, 40));
    lasers.add(new Laser(USSRobert.x-60, USSRobert.y-40, 40));
    lasers.add(new Laser(USSRobert.x+20, USSRobert.y-20, 40));
    lasers.add(new Laser(USSRobert.x-20, USSRobert.y-20, 40));
  } else if (USSRobert.turretCount == 5) {
    lasers.add(new Laser(USSRobert.x+60, USSRobert.y, 100));
    lasers.add(new Laser(USSRobert.x-60, USSRobert.y, 100));
    lasers.add(new Laser(USSRobert.x, USSRobert.y-40, 100));
  } else {
    for (int i = 0; i < USSRobert.turretCount; i++ ) {
      lasers.add(new Laser(USSRobert.x + i*30 - USSRobert.turretCount*30/2+15, USSRobert.y-40, 40));
    }
  }
}

void infoPanel() {
  fill(100, 127);
  rectMode(CENTER);
  textAlign(CORNER);
  rect(width/2, 50, width-50, 50);
  fill(255);
  textSize(30);
  text("Score: " + score + "   Level: " + level + "   Ammo: " + USSRobert.ammo + "   Health: " + USSRobert.health, 50, 60);
}

void startScreen() {
  background(0); 
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Click or press any key to start",width/2,height/2);
  if(mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
    textAlign(CENTER);
    fill(0);
    rect(0,0,width,height);
    fill(255);
    textSize(100);
    text("GAME OVER", width/2, height/2-20);
    textSize(30);
    text("Score: " + score, width/2, height/2+20);
    play = false;
    sadviolin.play();
    noLoop();
}
