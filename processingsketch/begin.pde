// start screen:
void begin() {
  circleCx = width/2;
  circleCy = height/2;
  background(0);
  drawBigCircle(true);
  drawMedCircle(true);
  drawSmallCircle(true);
  drawPos(posMode, true);
  beginDialogue();
  drawBeginButton();
}

// text on start screen:
void beginDialogue() {
  fill(255);
  textFont(font, 48);
  textSize(50);
  textAlign(LEFT, TOP);
  textLeading(80);
  text("Welcome to the Balance Board!\nClick on the button below to start the game.", 100, 100);
  fill(200);
}

// begin button:
void drawBeginButton() {
  fill(0, 250, 154, 125);
  stroke(0, 250, 154);
  rect(beginButtonX - beginButtonW / 2, beginButtonY - beginButtonH / 2, beginButtonW, beginButtonH, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("BEGIN", beginButtonX, beginButtonY);
}

// playing & beginning counter if begin button has been pressed:
void checkBeginPressed() {
  if (mouseX >= beginButtonX - beginButtonW / 2  && mouseX <= (beginButtonX + beginButtonW) && mouseY >= beginButtonY - beginButtonH / 2 && mouseY <= (beginButtonY + beginButtonH)) {
    isPlaying = true;
    timeBeforePlay = millis();
  }
}
