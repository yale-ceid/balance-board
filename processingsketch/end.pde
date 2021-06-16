void end() {
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER, BOTTOM);
  textSize(30);
  drawEndText();
  drawEndButton();
}

void drawEndText() {
  text("FINAL RESULTS:", width/2, height/2-150);
  text("Small : total ratio = " + nf(ratioSmallTotal, 0, 2), width/2, height/2-100);
  text("Medium : total ratio = " + nf(ratioMedTotal, 0, 2), width/2, height/2-50);
  text("Big : total ratio = " + nf(ratioBigTotal, 0, 2), width/2, height/2);
}

void drawEndButton() {
  fill(0, 250, 154);
  stroke(0, 250, 154);
  rect(endButtonX, endButtonY, endButtonW, endButtonH, 10);
  fill(0);
  text("START OVER", 400, 423);
}

void checkEndPressed() {
  if (isEnding && mouseX >= endButtonX && mouseX <= (endButtonX + endButtonW) && mouseY >= endButtonY && mouseY <= (endButtonY + endButtonH)) {
    reset();
  }
}

void reset() {
  isPlaying = false;
  isEnding = false;
  smallScoreNum = 0;
  medScoreNum = 0;
  bigScoreNum = 0;
  totalScoreNum = 0;
}
