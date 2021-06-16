void play() {
  drawScene();
  moveCircle();
  checkScore();
  checkRatios();
  checkIfEnding();
}

void drawScene() {
  background(0);
  fill(0);
  drawBigCircle(false);
  drawMedCircle(false);
  drawSmallCircle(false);
  drawPos(posMode, false);
  drawScore();
  drawRatios();
}

void moveCircle() {
  circleCx += stepSize;
  if (circleCx > width-bigCircleRad || circleCx < 0+bigCircleRad) {
    stepSize = -stepSize;
  }
  circleCy += stepSize;
  if (circleCy > height-bigCircleRad || circleCy < 0+bigCircleRad) {
    stepSize = -stepSize;
  }
}

void drawScore() {
  textSize(17);
  textAlign(LEFT, BOTTOM);
  fill(255, 165, 0);
  text("Score: " + str(bigScoreNum), 50, 520);
  fill(255, 255, 153);
  text("Score: " + str(medScoreNum), 50, 540);
  fill(152, 251, 152);
  text("Score: " + str(smallScoreNum), 50, 560);
  fill(255);
  text("Score: " + str(totalScoreNum), 50, 580);
}

void checkScore() {
  float dBig = sqrt(pow(circleCy - posY, 2) + pow(circleCx - posX, 2));
  if (dBig <= bigCircleRad) {
    bigScoreNum++;
  }
  float dMed = sqrt(pow(circleCy - posY, 2) + pow(circleCx - posX, 2));
  if (dMed <= medCircleRad) {
    medScoreNum++;
  }
  float dSmall = sqrt(pow(circleCy - posY, 2) + pow(circleCx - posX, 2));
  if (dSmall <= smallCircleRad) {
    smallScoreNum++;
  }
  totalScoreNum++;
}

void checkRatios() {
  ratioSmallTotal = smallScoreNum/float(totalScoreNum);
  ratioMedTotal = medScoreNum/float(totalScoreNum);
  ratioBigTotal = bigScoreNum/float(totalScoreNum);
}

void drawRatios() {
  fill(255, 255, 255);
  textAlign(RIGHT, BOTTOM);
  text("Small : total ratio = " + nf(ratioSmallTotal, 0, 2), width-50, 520);
  text("Medium : total ratio = " + nf(ratioMedTotal, 0, 2), width-50, 540);
  text("Big : total ratio = " + nf(ratioBigTotal, 0, 2), width-50, 560);
}

void checkIfEnding() {
  if (millis()-timeBeforePlay > playTime) {
    isEnding = true;
  }
}
