// John Sundberg | 10 Oct 2022 | Screensaver App
float xpos, ypos, strokeW, pointCount;

void setup() {
  size(displayWidth, displayHeight);
  fullScreen();
  xpos = random(width);
  ypos = random(height);
  background(0, 22.5, 0);
}
int counter = 0;

void draw() {
  if (counter == 2000) {
    counter = 0;
    background(0, 22.5, 0);
  }
  counter++;
  if (xpos > width || xpos < 0 || ypos < 0 || ypos > height ) {
    xpos = random(width);
    ypos = random(height);
  }
  float z1, z2;
  z1 = sqrt((abs(xpos-(width/2))/80)*(abs(xpos-(width/2))/80)+(abs(ypos-(height/2)))/70*(abs(ypos-(height/2)))/70);
  z2 = sqrt((abs(xpos-(width/2))/70)*(abs(xpos-(width/2))/70)+(abs(ypos-(height/2)))/60*(abs(ypos-(height/2)))/60);
  strokeW = random(z1, z2);
  pointCount = random(1, 100);
  stroke(0, random(strokeW*22.5, strokeW*40), 0);
  strokeWeight(strokeW);


  int direction = round(random(1, 100));
  if (direction>75) {
    moveRight(xpos, ypos, pointCount);
  } else if (direction>50) {
    moveUp(xpos, ypos, pointCount);
  } else if (direction>25) {
    moveLeft(xpos, ypos, pointCount);
  } else {
    moveDown(xpos, ypos, pointCount);
  }
}

void moveRight(float startx, float starty, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startx+i, starty);
  //stroke(0, random(strokeW*22.5, strokeW*23), 0);
    xpos = startx + i;
    ypos = starty;
  }
}
void moveLeft(float startx, float starty, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startx-i, starty);
  //stroke(0, random(strokeW*22.5, strokeW*23), 0);
    xpos = startx - i;
    ypos = starty;
  }
}
void moveUp(float startx, float starty, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startx, starty-i);
  //stroke(0, random(strokeW*22.5, strokeW*23), 0);
    xpos = startx;
    ypos = starty-i;
  }
}
void moveDown(float startx, float starty, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startx, starty + i);
  //stroke(0, random(strokeW*22.5, strokeW*23), 0);
    xpos = startx;
    ypos = starty+i;
  }
}
