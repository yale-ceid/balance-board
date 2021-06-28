// checking if begin/end buttons have been pressed:
void mousePressed() {
  checkBeginPressed();
  checkEndPressed();
}

// drawing background elements + checking if we are in begin or play state to alter their opacity (isFaded):

//outermost circle (orange):
void drawBigCircle(boolean isFaded) {
  if (isFaded == true) {
    stroke(255, 165, 0, 80);
  }
  //fill(255,140,0);
  else {
    stroke(255, 165, 0);
  }
  strokeWeight(5);
  circle(circleCx, circleCy, bigCircleRad*2);
}

// middle circle (yellow):
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

// innermost circle (green):
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

// checking if mouse or center of mass should determine cursor circle position (posType):
void drawPos(String posType, boolean isFaded) {
  if (posType.equals("mouse")) {
    drawMousePos(isFaded);
  } else if (posType.equals("COM")) {
    drawCOMPos(isFaded);
  }
}

// drawing mouse-based position cursor circle (blue):
void drawMousePos(boolean isFaded) {
  fill(32, 178, 170);
  if (isFaded == true) {
    stroke(102, 205, 170, 90);
    fill(32, 178, 170 );
  } else {
    stroke(102, 205, 170);
  }
  posX = mouseX;
  posY = mouseY;
  circle(mouseX, mouseY, cursCircleRad);
}

// drawing center-of-mass-based position cursor circle (blue):
void drawCOMPos(boolean isFaded) {
  posX = 0;
  posY = 0;
  if (lcReading.length < 5 || lcReading[1] == null || lcReading[2] == null || lcReading[3] == null || lcReading[4] == null) {
    return;
  }

  // IF YOU'RE HAVING MAPPING PROBLEMS

  // STEP ONE: MAKE SURE THESE ARE ACTUALLY BOTTOMLEFT, TOPLEFT ETC 
  float bottomLeftReading = float(lcReading[2]);
  float topLeftReading = float(lcReading[3]);
  float topRightReading = float(lcReading[1]);
  float bottomRightReading = float(lcReading[4]);

  // YOU CAN DEBUG BY UNCOMMENTING THIS
  //println("BL: ", bottomLeftReading + ", BR: " + bottomRightReading 
  //       + ", TL: " + topLeftReading + ", TR: " + topRightReading);

  float sumOfReadings = bottomLeftReading + topLeftReading + 
    topRightReading + bottomRightReading;

  if (sumOfReadings < 20) { 
    return;
  }

  float centerMassX = (( -1.0 * (bottomLeftReading + topLeftReading)) + (bottomRightReading + topRightReading)) / sumOfReadings;
  float centerMassY = (( -1.0 * (topLeftReading + topRightReading)) + (bottomLeftReading + bottomRightReading)) / sumOfReadings;

  // STEP TWO: MAKE SURE THE CENTER OF MASS ARE LEGIT LOOKING
  // CX: IT SHOULD BE BETWEEN: -1.0 on the left, +1.0 on the right
  // CY: IT SHOULD BE BETWEEN: -1.0 on the top, +1.0 on the bottom

  println("cx: " + centerMassX + ", cy: " + centerMassY);


  // STEP THREE: FIGURE OUT THE MAPPING
  // posX: IT SHOULD BE BETWEEN 0 and WIDTH
  // posY: IT SHOULD BE BETWEEN 0 AND HEIGHT

  float xScaleStart = (25.3/float (width)) + (float (width)/2); 
  float xScaleEnd = (15/float (height) + (float(height)/2)); 

  posX = int(map(centerMassX, 1.0, - 1.0, xScaleStart, xScaleEnd));
  posY = 100;

  print("posX: " + posX + ", posY: " + posY);


  if (isFaded == true) {
    stroke(102, 205, 170, 90);
  } else {
    stroke(102, 205, 170);
  }
  circle(posX, posY, cursCircleRad);
}
