import processing.serial.*;

Serial myPort;
String[] lcReading = new String[5];
PFont font;
int beginButtonX;
int beginButtonY;
int beginButtonW;
int beginButtonH;
int endButtonX;
int endButtonY;
int endButtonW;
int endButtonH;
int bigScoreNum = 0;
int medScoreNum = 0;
int smallScoreNum = 0;
int leftScoreNum = 0;
int rightScoreNum = 0;
int totalScoreNum = 0;
int forwardScoreNum = 0;
int backwardScoreNum = 0;
int cursCircleRad = 50;
float circleCx;
float circleCy;
float moveDirection = 100;
float ratioSmallTotal;
float ratioMedTotal;
float ratioBigTotal;
float ratioLeftTotal;
float ratioRightTotal;
float ratioForTotal;
float ratioBackTotal;
float endBarWidth;
boolean isPlayingDynamic;
boolean isPlayingStatic;
boolean isEnding;
int timeBeforePlay;
int posX;
int posY;
float sumPosX = 0;
float sumPosY = 0;
float avePosX;
float avePosY;

float lcx = 13.5;
float lcy = 9;

float bby;
float bbx;

// initialization of variables:
void setup() {
  fullScreen();
  myPort = new Serial(this, "/dev/cu.usbmodem1101",115200); //comment this out if using mouse mode!
  myPort.bufferUntil('\n'); //comment this out if using mouse mode!
  font = loadFont("Futura-Medium-48.vlw");
  //rectMode(CENTER);
  beginButtonX = width/2;
  beginButtonY = height/2;
  beginButtonW = 350;
  beginButtonH = 100;
  endButtonX = width/2;
  endButtonY = 8*height/9;
  endButtonW = 400;
  endButtonH = 100;
  circleCx = width/2;
  circleCy = height/2;
  isPlayingDynamic = false;
  isPlayingStatic = false;
  isEnding = false;
}

// loop of begin/play/end states:
void draw() {
  if (isEnding == true) {
    end();
  } else if (isPlayingDynamic == true) {
    playDynamic();
  } else if (isPlayingStatic == true) {
    playStatic();
  }
    else {
    begin();
  }
}

// reading load cell data from Arduino over serial and storing it in global variables:
void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    lcReading = split(inString, ',');
  }
}
