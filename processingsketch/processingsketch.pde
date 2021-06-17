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
float ratioSmallTotal;
float ratioMedTotal;
float ratioBigTotal;
boolean isPlaying;
boolean isEnding;
int timeBeforePlay;
int posX;
int posY;

// initialization of variables:
void setup() {
  size(800, 600);
  //myPort = new Serial(this, "/dev/cu.usbmodem1101",115200);
  //myPort.bufferUntil('\n');
  font = loadFont("Futura-Medium-48.vlw");
  beginButtonX = 450;
  beginButtonY = 450;
  beginButtonW = 300;
  beginButtonH = 100;
  endButtonX = 250;
  endButtonY = 350;
  endButtonW = 300;
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

// reading load cell data from arduino over serial and storing it in global variables:
void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    lcReading = split(inString, ',');
  }
}
