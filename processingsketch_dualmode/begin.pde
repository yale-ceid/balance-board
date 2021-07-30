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
  drawBeginDynamic();
  drawBeginStatic();
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
  textSize(20);
  text("© Yale CEID 2021. Contributors: Lawrence Wilen, Mel Adams, Kalina Mladenova, Sarim Abbas, Antonio Medina, Kayla Morgan and Lily Dorstewitz.", 50, height-50);
}

// begin button:
void drawBeginDynamic() {
  fill(0, 250, 154, 125);
  stroke(0, 250, 154);
  rect(beginButtonX - beginButtonW / 2, beginButtonY - beginButtonH / 2, beginButtonW, beginButtonH, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(255);
  text("BEGIN DYNAMIC MODE", beginButtonX, beginButtonY);
}
void drawBeginStatic() {
  fill(0, 250, 154, 125);
  stroke(0, 250, 154);
  rect(beginButtonX - beginButtonW / 2, beginButtonY + 2 * beginButtonH, beginButtonW, beginButtonH, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(27);
  fill(255);
  text("BEGIN STATIC MODE", beginButtonX, beginButtonY + (5 * beginButtonH) / 2);
  noFill();
}

// playing & beginning counter if begin button has been pressed:
void checkBeginPressed() {
  if (mouseX >= beginButtonX - beginButtonW / 2  && mouseX <= (beginButtonX + beginButtonW / 2) && mouseY >= beginButtonY - beginButtonH / 2 && mouseY <= (beginButtonY + beginButtonH) && (isPlayingDynamic == false)) {
    isPlayingDynamic = true;
  }
  else if (mouseX >= beginButtonX - beginButtonW / 2  && mouseX <= (beginButtonX + beginButtonW / 2) && mouseY >= beginButtonY + 2 * beginButtonH && mouseY <= ((beginButtonY + 2 * beginButtonH) + beginButtonH) && (isPlayingStatic == false)) {
    isPlayingStatic = true;
  }
  timeBeforePlay = millis();

}
