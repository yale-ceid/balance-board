

#include <HX711.h>

#define DOUT_1 12
#define CLK_1  11
#define DOUT_2 6
#define CLK_2  7
#define DOUT_3 4
#define CLK_3  3
#define DOUT_4 8
#define CLK_4  9

HX711 scale1;
HX711 scale2;
HX711 scale3;
HX711 scale4;

float reading_1;
float reading_2;
float reading_3;
float reading_4;

float calibration_factor1 = - 46880.00;
float calibration_factor2 = - 46880.00;
float calibration_factor3 = - 46880.00;
float calibration_factor4 = - 46880.00;

void setup() {
  Serial.begin(115200);

  scale1.begin(12, 11);
  scale1.set_scale();
  scale1.tare(); //Reset the scale to 0

  scale2.begin(6, 7);
  scale2.set_scale();
  scale2.tare(); //Reset the scale to 0

  scale3.begin(4, 3);
  scale3.set_scale();
  scale3.tare(); //Reset the scale to 0

  scale4.begin(8, 9);
  scale4.set_scale();
  scale4.tare(); //Reset the scale to 0

}

void loop() {

  Serial.print (millis());
  Serial.print (",");

  scale1.set_scale(calibration_factor1); //Adjust to this calibration factor
  reading_1 = scale1.get_units();

  Serial.print(reading_1, 1.00);
  Serial.print (",");

  scale2.set_scale(calibration_factor2); //Adjust to this calibration factor
  reading_2 = scale2.get_units();

  Serial.print(reading_2, 1.00);
  Serial.print (",");

  scale3.set_scale(calibration_factor3); //Adjust to this calibration factor
  reading_3 = - scale3.get_units();

  Serial.print(reading_3, 1.00);
  Serial.print (",");

  scale4.set_scale(calibration_factor4); //Adjust to this calibration factor
  reading_4 = - scale4.get_units();

  Serial.print(reading_4, 1.00);

  Serial.println();

  delay(20);


}
