// end screen:
void end() {
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER, BOTTOM);
  textSize(30);
  drawAvePos();
  drawAvePosCircle();
  drawBigCircle(true);
  drawMedCircle(true);
  drawSmallCircle(true);
  drawEndText();
  drawEndBar();
  drawEndFill();
  drawEndButton();
}

// text on end screen:
void drawEndText() {
  fill(255);
  textSize(50);
  text("FINAL RESULTS:", width/2, height/4-100);
  textSize(40);
  textLeading(80);
  text("Balance percentage: " + nf(ratioSmallTotal*100, 0, 2) + "%", width/2, (height/2)-230);
  text("Average X position: " + nf(avePosX, 0, 2) + " / Average Y position: " + nf(avePosY, 0, 2), width/2, (height/2 + 125));
  //text("Small : total ratio = " + nf(ratioSmallTotal, 0, 2) + "\nMedium : total ratio = " + nf(ratioMedTotal, 0, 2) + "\nBig : total ratio = " + nf(ratioBigTotal, 0, 2), width/2, (height/2)+50);
}

// bar graph visually reflecting balance percentage:
void drawEndBar() {
  stroke(255);
  noFill();
  rect((width/2)-300, height/2-150, 600, 80, 7);
}

void drawEndFill() {
  endBarWidth = ratioSmallTotal*600;
  if (ratioSmallTotal < 0.25) {
    fill(220, 20, 60);
    stroke(220, 20, 60);
  } else if (ratioSmallTotal >= 0.25 && ratioSmallTotal < 0.5) {
    fill(255, 165, 0);
    stroke(255, 165, 0);
  } else if (ratioSmallTotal >= 0.5 && ratioSmallTotal < 0.75) {
    fill(173, 255, 47);
    stroke(173, 255, 47);
  } else if (ratioSmallTotal >= 0.75) {
    fill(50, 205, 50);
    stroke(50, 205, 50);
  }
  rect((width/2-300)+5, (height/2)-145, endBarWidth-10, 80-10, 1);
}

void drawAvePos() {
  avePosX = sumPosX / float(totalScoreNum);
  avePosY = sumPosY / float(totalScoreNum);
}

void drawAvePosCircle() {
  stroke(102, 205, 170, 90);
  fill(32, 178, 170 );
  circle(avePosX, avePosY, 50);
  noFill();
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
  isPlayingDynamic = false;
  isPlayingStatic = false;
  isEnding = false;
  smallScoreNum = 0;
  medScoreNum = 0;
  bigScoreNum = 0;
  totalScoreNum = 0;
  sumPosX = 0;
  sumPosY = 0;
}
