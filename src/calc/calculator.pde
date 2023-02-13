//John Sundberg | November 2022 | Calculator Project

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
boolean left = true;
float l, r, result;
char op = ' ';

void setup() {
  size(400, 520);
  background(25);
  noStroke();
  numButtons[0] = new Button(40, 440, 140, 40, '0', 1, op);
  numButtons[1] = new Button(40, 360, 60, 60, '1', 1, op);
  numButtons[2] = new Button(120, 360, 60, 60, '2', 1, op);
  numButtons[3] = new Button(200, 360, 60, 60, '3', 1, op);
  numButtons[4] = new Button(40, 280, 60, 60, '4', 1, op);
  numButtons[5] = new Button(120, 280, 60, 60, '5', 1, op);
  numButtons[6] = new Button(200, 280, 60, 60, '6', 1, op);
  numButtons[7] = new Button(40, 200, 60, 60, '7', 1, op);
  numButtons[8] = new Button(120, 200, 60, 60, '8', 1, op);
  numButtons[9] = new Button(200, 200, 60, 60, '9', 1, op);

  opButtons[0] = new Button(200, 440, 40, 40, '=', 4, op);
  opButtons[1] = new Button(260, 440, 40, 40, '.', 4, op);
  opButtons[2] = new Button(320, 440, 40, 40, '%', 4, op);
  opButtons[3] = new Button(280, 380, 80, 40, '+', 2, op);
  opButtons[4] = new Button(280, 320, 80, 40, '-', 2, op);
  opButtons[5] = new Button(280, 260, 80, 40, 'x', 2, op);
  opButtons[6] = new Button(280, 200, 80, 40, '÷', 2, op);
  opButtons[7] = new Button(320, 140, 40, 40, '±', 6, op);
  opButtons[8] = new Button(260, 140, 40, 40, '√', 3, op);
  opButtons[9] = new Button(200, 140, 40, 40, '²', 3, op);
  opButtons[10] = new Button(120, 140, 60, 40, 'E', 5, op);
  opButtons[11] = new Button(40, 140, 60, 40, 'C', 5, op);
}

void draw() {
  background(25);
  fill(195);
  rect(0, 0, 400, 520, 15);
  fill(100);
  rect(0, 0, 400, 120, 15, 15, 0, 0);
  updateDisplay();



  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
    opButtons[i].op = op;
  }
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:"+keyCode);
  if (keyCode == 49 || keyCode == 97) {
    doEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    doEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    doEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    doEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    doEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    doEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    doEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    doEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    doEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    doEvent("0", true);
  } else if (keyCode == 46 || keyCode == 110) {
    doEvent(".", false); 
  } else if (keyCode == 67) {
    doEvent("C", false);
  } else if (keyCode == 69) {
    doEvent("E", false);
  } else if (keyCode == 61 || keyCode == 107) {
    doEvent("+", false); 
  } else if (keyCode == 45 || keyCode == 109) {
    doEvent("-", false);
  } else if (keyCode == 48 || keyCode == 96) {
    doEvent("x", false);
  } else if (keyCode == 47 || keyCode == 111) {
    doEvent("÷", false); 
  } else if (keyCode == 10) {
    doEvent("=", false); 
  }
}


void doEvent(String val, boolean isNum) {
  if (isNum && dVal.length() < 18) {
    if (dVal.equals("0")||dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal = dVal+val;
    }
    if (left) {
      l =  float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    left = true;

    l = 0;
    r = 0;
    result = 0;
    op = ' ';
  } else if (val.equals("E")) {
    dVal = "0";
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0";
    if (left) {
      left = false;
    } else {
      left = true;
    }
    if (float(dVal) == int(dVal)) {
      dVal = str(int(dVal));

    }
  } else if (val.equals("-")) {
        op = '-';
        dVal = "0";
        if (left) {
          left = false;
        } else {
          left = true;
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));

        }
  } else if (val.equals("x")) {
        op = 'x';
        dVal = "0";
        if (left) {
          left = false;
        } else {
          left = true;
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));
        }
  } else if (val.equals("÷")) {
        op = '÷';
        dVal = "0";
        if (left) {
          left = false;
        } else {
          left = true;
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));
        }
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal = dVal+".";

    }
  } else if (val.equals("=")) {

    performCalculation();
    //op = ' ';  

    }
}


void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].on) {
      doEvent(str(numButtons[i].val), true);
    }
  }
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].on) {
      if (opButtons[i].val == 'C') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == 'E') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == '+') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == '-') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == 'x') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == '÷') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == '%') {
        //op = '%';

        if (left) {
          l /= 100;
          dVal = str(l);
        } else {
          r /= 100;
          dVal = str(r);
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));
        }
      } else if (opButtons[i].val == '²') {
        op = '²';
        if (left) {
          l = sq(l);
          dVal = str(l);
        } else {
          r = sq(r);
          dVal = str(r);
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));
        }
      } else if (opButtons[i].val == '√') {
        op = '√';
        if (left) {
          l = sqrt(l);
          dVal = str(l);
        } else {
          r = sqrt(r);
          dVal = str(r);
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));
        }
      } else if (opButtons[i].val == '±') {
        if (left) {
          l = -l;
          dVal = str(l);
        } else {
          r = -r;
          dVal = str(r);
        }
        if (float(dVal) == int(dVal)) {
          dVal = str(int(dVal));
        }
      } else if (opButtons[i].val == '=') {
        doEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].val == '.') {
        doEvent(str(opButtons[i].val), false);
      }
    }
  }

  println("l:" + l + " r:" + r + " op:" + op + " result:" + result + " left:" + left);
}

void updateDisplay() {

  fill(195);
  rect(0, 0, 400, 520, 15);
  fill(100);
  rect(0, 0, 400, 120, 15, 15, 0, 0);
  textAlign(RIGHT);
  if (dVal.length() < 7) {
    textSize(90);
  } else {
    textSize(630/dVal.length());
  }
  fill(255);
  text(dVal, width-40, 90);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result =  l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == ' ') {
    result = l;
  }


  if (result == (int)result) {
    dVal = str(int(result));
  } else {
    dVal = str(result);
  }




  l = result;
  left = true;
  updateDisplay();
}
