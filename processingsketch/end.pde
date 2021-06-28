// end screen:
void end() {
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER, BOTTOM);
  textSize(30);
  drawEndText();
  drawEndButton();
}

// text on end screen:
void drawEndText() {
  textSize(50);
  text("FINAL RESULTS:", width/2, height/4);
  textSize(40);
  textLeading(80);
  text("Small : total ratio = " + nf(ratioSmallTotal, 0, 2) + "\nMedium : total ratio = " + nf(ratioMedTotal, 0, 2) + "\nBig : total ratio = " + nf(ratioBigTotal, 0, 2), width/2, (height/2)+50);
}

// end button:
void drawEndButton() {
  fill(0, 250, 154);
  stroke(0, 250, 154);
  rect(endButtonX - endButtonW / 2, endButtonY  - endButtonH / 2, endButtonW, endButtonH, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("START OVER", endButtonX, endButtonY);
}

// resetting if end button has been pressed:
void checkEndPressed() {
  if (isEnding && mouseX >= endButtonX - endButtonW / 2 && mouseX <= (endButtonX + endButtonW) && mouseY >= endButtonY - endButtonH / 2 && mouseY <= (endButtonY + endButtonH)) {
    reset();
  }
}

// resetting:
void reset() {
  isPlaying = false;
  isEnding = false;
  smallScoreNum = 0;
  medScoreNum = 0;
  bigScoreNum = 0;
  totalScoreNum = 0;
}
