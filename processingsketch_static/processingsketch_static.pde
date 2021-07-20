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
int totalScoreNum = 0;
int cursCircleRad = 50;
float circleCx;
float circleCy;
float moveDirection = 100;
float ratioSmallTotal;
float ratioMedTotal;
float ratioBigTotal;
float endBarWidth;
boolean isPlaying;
boolean isEnding;
int timeBeforePlay;
int posX;
int posY;

float lcx = 13.5;
float lcy = 9;

float bby;
float bbx;

// initialization of variables:
void setup() {
  fullScreen();
  //myPort = new Serial(this, "/dev/cu.usbmodem1101",115200); //comment this out if using mouse mode!
  //myPort.bufferUntil('\n'); //comment this out if using mouse mode!
  font = loadFont("Futura-Medium-48.vlw");
  //rectMode(CENTER);
  beginButtonX = width/2;
  beginButtonY = height/2;
  beginButtonW = 300;
  beginButtonH = 100;
  endButtonX = width/2;
  endButtonY = 3*height/4;
  endButtonW = 400;
  endButtonH = 100;
  circleCx = width/2;
  circleCy = height/2;
  isPlaying = false;
  isEnding = false;
}

// loop of begin/play/end states:
void draw() {
  if (isEnding == true) {
    end();
  } else if (isPlaying == true) {
    play();
  } else {
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
