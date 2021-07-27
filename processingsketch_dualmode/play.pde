// play screen:
void playDynamic() {
  drawDynamicScene();
  moveCircle();
  checkDynamicScore();
  checkDynamicRatios();
  checkIfEnding();
}

// drawing play scene:
void drawDynamicScene() {
  background(0);
  fill(0);
  drawBigCircle(false);
  drawMedCircle(false);
  drawSmallCircle(false);
  drawPos(posMode, false);
  drawDynamicScore();
  drawDynamicRatios();
}

// DYNAMIC MODE - comment out if not desired:
void moveCircle() {
  textAlign(LEFT, TOP);
  textLeading(80);
  text("DYNAMIC MODE", 100, 100);
  fill(200);

  // X-Y SHIFT MODE:
  if (millis()-timeBeforePlay < (playTime/2)-delayTime/2) {
    circleCx = (width/2) + moveDirection * sin(2*3.1415*((float(millis())-float(timeBeforePlay))/(float(playTime/2)-delayTime/2)));
  } else if (millis()-timeBeforePlay > (playTime/2)+delayTime/2) {
    circleCy = (height/2) + moveDirection * sin(2*3.1415*((float(millis())-float(timeBeforePlay)-delayTime/2-float(playTime/2))/(float(playTime/2)-delayTime/2)));
  }

  ////MOUSE-TRACKING MODE:
  //if (mouseX < width-smallCircleRad && mouseX > smallCircleRad) {
  //  circleCx = mouseX;
  //}
  //if (mouseY < height-smallCircleRad && mouseY > smallCircleRad) {
  //  circleCy = mouseY;
  //}

  //if (circleCx > width-bigCircleRad || circleCx < 0+bigCircleRad) {
  //  stepSize = -stepSize;
  //}
  //if (circleCy > height-bigCircleRad || circleCy < 0+bigCircleRad) {
  //  stepSize = -stepSize;
  //}
  //if (millis() % 1 == 0) {
  //  circleCx += stepSize;
  //  circleCy += stepSize;
  //}
}

// drawing various scores in bottom left corner:
void drawDynamicScore() {
  textSize(30);
  textAlign(LEFT, BOTTOM);
  fill(255, 165, 0);
  text("Score: " + str(bigScoreNum), 50, height-350);
  fill(255, 255, 153);
  text("Score: " + str(medScoreNum), 50, height-300);
  fill(152, 251, 152);
  text("Score: " + str(smallScoreNum), 50, height-250);
  fill(255);
  text("Left score: " + str(leftScoreNum), 50, height-200);
  text("Right score: " + str(rightScoreNum), 50, height-150);
  text("Forward score: " + str(forwardScoreNum), 50, height-100);
  text("Backward score: " + str(backwardScoreNum), 50, height-50);
  text("Total score: " + str(totalScoreNum), 50, height);
}

// changing the score according to position:
void checkDynamicScore() {
  float dSize = sqrt(pow(circleCy - posY, 2) + pow(circleCx - posX, 2));
  if (dSize <= bigCircleRad) {
    bigScoreNum++;
  }
  if (dSize <= medCircleRad) {
    medScoreNum++;
  }
  if (dSize <= smallCircleRad) {
    smallScoreNum++;
  }
  if (posX < circleCx) {
    leftScoreNum++;
  } else if (posX > circleCx) {
    rightScoreNum++;
  }
  if (posY < circleCy) {
    forwardScoreNum++;
  } else if (posY > circleCy) {
    backwardScoreNum++;
  }
  totalScoreNum++;
}

// checking ratios between various scores:
void checkDynamicRatios() {
  ratioSmallTotal = smallScoreNum/float(totalScoreNum);
  ratioMedTotal = medScoreNum/float(totalScoreNum);
  ratioBigTotal = bigScoreNum/float(totalScoreNum);
  ratioLeftTotal = leftScoreNum/float(totalScoreNum);
  ratioRightTotal = rightScoreNum/float(totalScoreNum);
  ratioForTotal = forwardScoreNum/float(totalScoreNum);
  ratioBackTotal = backwardScoreNum/float(totalScoreNum);
}

// drawing ratios in bottom right corner:
void drawDynamicRatios() {
  fill(255, 255, 255);
  textAlign(RIGHT, BOTTOM);
  text("Small : total ratio = " + nf(ratioSmallTotal, 0, 2), width-50, height-350);
  text("Medium : total ratio = " + nf(ratioMedTotal, 0, 2), width-50, height-300);
  text("Big : total ratio = " + nf(ratioBigTotal, 0, 2), width-50, height-250);
  text("Left : total ratio = " + nf(ratioLeftTotal, 0, 2), width-50, height-200);
  text("Right : total ratio = " + nf(ratioRightTotal, 0, 2), width-50, height-150);
  text("Forward : total ratio = " + nf(ratioForTotal, 0, 2), width-50, height-100);
  text("Backward : total ratio = " + nf(ratioBackTotal, 0, 2), width-50, height-50);
}

// checking if play state should end:
void checkIfEnding() {
  if (millis()-timeBeforePlay > playTime) {
    isEnding = true;
  }
}
