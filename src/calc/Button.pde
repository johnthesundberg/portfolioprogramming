class Button {
  //Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;
  int cselect;
  char op;
  //Constructor
  Button(int x, int y, int w, int h, char val, int cselect, char op) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.op = op;
    if(cselect == 1) {
    c1 = color(165);
    c2 = color(225);
    } else if(cselect == 2) {
    c1 = color(222,92,90);
    c2 = color(235,200,200);
    }
    else if(cselect == 3){
    c1 = color(135);
    c2 = color(215);
    } else if(cselect == 4){
    c1 = color(215);
    c2 = color(230);
    }
    else if(cselect == 5){
    c1 = color(76,139,245);
    c2 = color(106,179,255);
    }
    else {
    c1 = color(255,196,68);
    c2 = color(255,226,98);
    }
    on = false;
  }
  void display() {
    if (on || op == val) {
      fill(c2);
    } else {
      fill(c1);
    }

    rect(x, y, w, h, 15);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    if(val == 'E') {
      text("CE",(x+w/2), (y+h*1.24/2));
    } else if(val == '²') {
      text("x²",(x+w/2), (y+h*1.24/2));
    }
    else {
    text(val, (x+w/2), (y+h*1.24/2));
    } 
  }
  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y + h);
  }
}
