void begin() { // start screen
  background(0);
  drawBigCircle(true);
  drawMedCircle(true);
  drawSmallCircle(true);
  drawPos(posMode, true);
  beginDialogue();
  drawBeginButton();
}

void beginDialogue() { // text on start screen
  fill(255);
  textFont(font, 48);
  textSize(30);
  textAlign(LEFT, TOP);
  textLeading(50);
  text("Welcome to the Balance Board!\nClick on the button below to start the game.", 50, 50);
  fill(200);
}

void drawBeginButton() { // begin button
  fill(0, 250, 154);
  stroke(0, 250, 154);
  rect(beginButtonX, beginButtonY, beginButtonW, beginButtonH, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("BEGIN", 600, 500);
}

void checkBeginPressed() { // checking if begin button has been pressed
  if (mouseX >= beginButtonX && mouseX <= (beginButtonX + beginButtonW) && mouseY >= beginButtonY && mouseY <= (beginButtonY + beginButtonH)) {
    isPlaying = true;
    timeBeforePlay = millis();
  }
}
