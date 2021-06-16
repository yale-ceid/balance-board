void mousePressed() {
  checkBeginPressed();
  checkEndPressed();
}

void drawBigCircle(boolean isFaded) {
  if (isFaded == true) {
    stroke(255, 165, 0, 80);
  }
  //fill(255,140,0);
  else {
    stroke(255, 165, 0);
  }
  strokeWeight(3);
  circle(circleCx, circleCy, bigCircleRad*2);
}

void drawMedCircle(boolean isFaded) {
  if (isFaded == true) {
    stroke(255, 255, 153, 80);
  }
  //fill(255,255,102);
  else {
    stroke(255, 255, 153);
  }
  circle(circleCx, circleCy, medCircleRad*2);
}

void drawSmallCircle(boolean isFaded) {
  if (isFaded == true) {
    stroke(152, 251, 152, 80);
  }  
  //fill(144,238,144);
  else {
    stroke(152, 251, 152);
  }
  circle(circleCx, circleCy, smallCircleRad*2);
}

void drawPos(String posType, boolean isFaded) {
  if (posType.equals("mouse")) {
    drawMousePos(isFaded);
  } else if (posType.equals("COM")) {
    drawCOMPos(isFaded);
  }
}
void drawMousePos(boolean isFaded) {
  if (isFaded == true) {
    stroke(102, 205, 170, 90);
  }   
  //fill(32,178,170);
  else {
    stroke(102, 205, 170);
  }
  posX = mouseX;
  posY = mouseY;
  circle(mouseX, mouseY, cursCircleRad);
}

void drawCOMPos(boolean isFaded) {
  posX = 0;
  posY = 0;
  if (lcReading.length < 5 || lcReading[1] == null || lcReading[2] == null || lcReading[3] == null || lcReading[4] == null) {
    return;
  }

  float bottomLeftReading = float(lcReading[1]);
  float topLeftReading = float(lcReading[2]);
  float topRightReading = float(lcReading[3]);
  float bottomRightReading = float(lcReading[4]);

  float sumOfReadings = bottomLeftReading + topLeftReading + topRightReading + bottomRightReading;
  float centerMassX = (( -1.0 * (bottomLeftReading + topLeftReading)) + (bottomRightReading + topRightReading)) / sumOfReadings;
  float centerMassY = (( -1.0 * (topLeftReading + topRightReading)) + (bottomLeftReading + bottomRightReading)) / sumOfReadings;

  if (sumOfReadings < 20) { 
    return;
  }

  posX = int(map(centerMassX, 1.0, - 1.0, 133.1*2 + 235*2, 235*2 - 133.1*2));
  posY = int(map(centerMassY, 1.0, - 1.0, 88.4*2 + 150*2, 150*2 - 88.4*2 ));
  println(posX);
  println(posY);
  if (isFaded == true) {
    stroke(102, 205, 170, 90);
  } else {
    stroke(102, 205, 170);
  }
  circle(posX, posY, cursCircleRad);
}
