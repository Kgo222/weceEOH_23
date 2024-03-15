/*

*/
#define PI 3.1415926535897932384626433832795

#include <SoftwareSerial.h>
#include <Servo.h>

int left_sensor;
int right_sensor;
int above_sensor;
int below_sensor;
int deadband = 30;

Servo servo01;
Servo servo02;
Servo servo03;
Servo servo04;


int servo1Pos, servo2Pos, servo3Pos, servo4Pos; // current position
int servo1PPos, servo2PPos, servo3PPos, servo4PPos; // previous position
int servo01SP[50], servo02SP[50], servo03SP[50], servo04SP[50]; // for storing positions/steps
//int speedDelay = 20;
int index = 0;
SoftwareSerial Bluetooth(0,1); //Arduino(RX,TX) to HM-10 Bluetooth(TX,RX)
String dataIn = "";
String direct = "";
String mode = "auto";
int location;


void setup() {
  
  Serial.begin(9600); 
  
  servo01.attach(5);
  servo02.attach(6);
  servo03.attach(7);
  servo04.attach(8);
  
//Set up bluetooth
  Bluetooth.begin(9600);
  Bluetooth.setTimeout(1);
  Serial.begin(9600);

  // Panel's initial position
  servo1PPos = 90;
  servo1Pos = 90;
  servo01.write(servo1PPos); //top-right
  servo2PPos = 90;
  servo2Pos = 90;
  servo02.write(servo2PPos); //bottom-right
  servo3PPos = 90;
  servo3Pos = 90;
  servo03.write(servo3PPos); //top-left
  servo4PPos = 90;
  servo4Pos = 90;
  servo04.write(servo4PPos); //bottom-left
  delay(2000);
  Serial.println("begin");
}

void resetservo(){
  while (servo1PPos!=90 || servo2PPos!=90 || servo3PPos!=90 || servo4PPos!=90){
    if (servo1PPos<90){
      servo1Pos = servo1PPos+1;
    }
    else if (servo1PPos>90){
      servo1Pos = servo1PPos-1;
    }
    if (servo2PPos<90){
      servo2Pos = servo2PPos+1;
    }
    else if (servo2PPos>90){
      servo2Pos = servo2PPos-1;
    }
    if (servo3PPos<90){
      servo3Pos = servo3PPos+1;
    }
    else if (servo3PPos>90){
      servo3Pos = servo3PPos-1;
    }
    if (servo4PPos<90){
      servo4Pos = servo4PPos+1;
    }
    else if (servo4PPos>90){
      servo4Pos = servo4PPos-1;
    }
    servo01.write(servo1Pos);
    servo02.write(servo2Pos);
    servo03.write(servo3Pos);
    servo04.write(servo4Pos);
    servo1PPos=servo1Pos; 
    servo2PPos=servo2Pos; 
    servo3PPos=servo3Pos; 
    servo4PPos=servo4Pos; 
    delay(15);
  }
}
void loop() {
  above_sensor = analogRead(A3);
  below_sensor = analogRead(A2);
  left_sensor = analogRead(A1);
  right_sensor = analogRead(A0);
  
  if(!dataIn.equals("")){
    if(dataIn.endsWith("%")){ // check it is full instruction
        //Process incoming data
         Serial.print("dataIn: ");
         Serial.println(dataIn);
         location = dataIn.indexOf("%");
         direct = dataIn.substring(0,location);  //gets only direction from data
         Serial.print("direction:");
         Serial.println(direct);
         if(direct.equals("manual")){mode = "manual";}
         else if(direct.equals("auto")){mode = "auto";}
         Serial.print("mode:");
         Serial.println(mode);
         //usedData = false;
    } 
  }
  //Check for bluetooth data
  if(Bluetooth.available() != 0){
    Serial.print("Bluetooth Available: ");
    Serial.println(Bluetooth.available());
    }
   if(Bluetooth.available() >0){
    dataIn = dataIn+Bluetooth.readString();  // Read the data as string
    if(dataIn.endsWith("%")){ // Listening for BT communication
        //Process incoming data
         Serial.print("dataIn: ");
         Serial.println(dataIn);
         location = dataIn.indexOf("%");
         direct = dataIn.substring(0,location);  //gets only direction from data
         Serial.print("direction:");
         Serial.println(direct);
         if(direct.equals("manual")){mode = "manual";}
         else if(direct.equals("auto")){mode = "auto";}
         Serial.print("mode:");
         Serial.println(mode);
         //usedData = false;
    }
   }
   
  //int adc = analogRead(A4);
  /*
  //int adc2 = analogRead(A5);
  float voltage = adc*5.0/1023;
  //float voltr = 2*(adc2*5.0)/1023;
  float current = (voltage-2.5)/0.185; //5A current sensor used
  if (current<0) current=0.0;
  float power = voltage*current;
  Serial.print("Left = ");
  Serial.print(left_sensor);
  Serial.print(", Right = ");
  Serial.println(right_sensor);
  Serial.print(", Above = ");
  Serial.println(above_sensor);
  Serial.print(", Below = ");
  Serial.println(below_sensor);
  Serial.print("Voltage = ");
  Serial.println(voltage);
  //Serial.print("Volt real = ");
  //Serial.println(voltr);
  Serial.print("Current = ");
  Serial.println(current);
  Serial.print("Power generated = ");
  Serial.println(power);
  //Serial.print("Power real = ");
  //Serial.println(voltr*current);*/
  
  //maybe different deadband values should be assigned while dealing with above and below sensors wrt left and right sensors.
  //if (left_sensor > right_sensor + deadband && left_sensor > above_sensor + deadband && left_sensor > below_sensor + deadband) Serial.println("Turn left");
  //for each direction reset motor positions first to initial state then turn
  //each servo is placed at each corner of the solar panel
  if(mode.equals("auto")){
    Serial.println("in auto");
  if (left_sensor > right_sensor + deadband){ //possibly go left
    if(above_sensor > below_sensor + deadband){
      double angle = atan(above_sensor/ (left_sensor));
      if(angle < 0.39269908){
        Serial.println("Turn left (W)");
        if (servo3PPos<servo4PPos || servo1PPos<servo2PPos){ //setting from NW or N to W
          int val3 = servo3PPos;
          int val2 = servo2PPos;
          while (servo4PPos!=val3 && servo1PPos!=val2) {
            servo4Pos=servo4PPos-1;
            servo1Pos=servo1PPos+1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        if (servo3PPos!=servo4PPos || servo1PPos!=90 || servo2PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo3PPos!=60 && servo4PPos!=60 && servo3PPos==servo4PPos && servo1PPos==servo2PPos){
          servo3Pos=servo3PPos-2;
          servo4Pos=servo4PPos-2;
          servo03.write(servo3Pos);
          servo04.write(servo4Pos);
          servo3PPos=servo3Pos;
          servo4PPos=servo4Pos;
          delay(15);
        }
        delay(3000);
      }
      else if(angle > 0.39269908 && angle < 0.39269908+(PI/4)){
        Serial.println("Turn up-left (NW)"); //for a diagonal direction (i.e., NW, SE, SW, NE), the angle lowered by the other two corners of the panel
        if (servo3PPos==servo4PPos && servo1PPos>servo3PPos){ //setting from W to NW
          int val3 = servo3PPos;
          int val4 = (90+val3)/2;
          while (servo4PPos!=val4){
            servo4Pos=servo4PPos+1;
            servo1Pos=servo1PPos-1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        else if (servo3PPos==servo1PPos && servo4PPos>servo3PPos){ //setting from N to NW
          int val3 = servo3PPos;
          int val4 = (90+val3)/2;
          while (servo4PPos!=val4){
            servo4Pos=servo4PPos-1;
            servo1Pos=servo1PPos+1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        } 
        if (servo3PPos>=servo1PPos || servo3PPos>=servo4PPos || servo2PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo3PPos!=60){             // are half of the angle lowered by the diagonally opposite corner wrt the fixed corner.
          servo3Pos=servo3PPos-2;
          servo1Pos=servo1PPos-1;
          servo4Pos=servo4PPos-1;
          servo03.write(servo3Pos);
          servo01.write(servo1Pos);
          servo04.write(servo4Pos);
          servo3PPos=servo3Pos;
          servo1PPos=servo1Pos;
          servo4PPos=servo4Pos;
          delay(15);
       }
        delay(3000);
      }
      else{
        Serial.println("Turn Up (N)");
        if (servo3PPos<servo1PPos || servo4PPos<servo2PPos){ //setting from NW or W to N
          int val3 = servo3PPos;
          int val2 = servo2PPos;
          while (servo1PPos!=val3 && servo4PPos!=val2) {
            servo4Pos=servo4PPos+1;
            servo1Pos=servo1PPos-1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        if (servo3PPos!=servo1PPos || servo4PPos!=90 || servo2PPos!=90) {//setting from other random direction to Reset
          resetservo();
        }
        while (servo1PPos!=60 && servo3PPos!=60 && servo1PPos==servo3PPos && servo2PPos==servo4PPos){
          servo1Pos=servo1PPos-2;
          servo3Pos=servo3PPos-2;
          servo01.write(servo1Pos);
          servo03.write(servo3Pos);
          servo1PPos=servo1Pos;
          servo3PPos=servo3Pos;
          delay(15);
        }
        delay(3000);
      }
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else{
      double angle = atan(below_sensor/ (left_sensor));
      if(angle < 0.39269908){
        Serial.println("Turn left (W)");
        if (servo4PPos<servo3PPos || servo2PPos<servo1PPos){ //setting from SW or S to W
          int val1 = servo1PPos;
          int val4 = servo4PPos;
          while (servo3PPos!=val4 && servo2PPos!=val1) {
            servo3Pos=servo3PPos-1;
            servo2Pos=servo2PPos+1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        if (servo3PPos!=servo4PPos || servo1PPos!=90 || servo2PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo3PPos!=60 && servo4PPos!=60 && servo3PPos==servo4PPos && servo1PPos==servo2PPos){ //  for W
          servo3Pos=servo3PPos-2;
          servo4Pos=servo4PPos-2;
          servo03.write(servo3Pos);
          servo04.write(servo4Pos);
          servo3PPos=servo3Pos;
          servo4PPos=servo4Pos;
          delay(15);
        }
        delay(3000);
      }
      else if(angle > 0.39269908 && angle < 0.39269908+(PI/4)){
        Serial.println("Turn down-left (SW)");
        if (servo3PPos==servo4PPos && servo1PPos>servo3PPos){ //setting from W to SW 
          int val4 = servo4PPos;
          int val3 = (90+val4)/2;
          while (servo3PPos!=val3){
            servo3Pos=servo3PPos+1;
            servo2Pos=servo2PPos-1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        else if (servo3PPos==servo1PPos && servo4PPos<servo3PPos){ //setting from S to SW 
          int val4 = servo4PPos;
          int val3 = (90+val4)/2;
          while (servo3PPos!=val3){
            servo3Pos=servo3PPos-1;
            servo2Pos=servo2PPos+1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        if (servo4PPos>=servo2PPos || servo4PPos>=servo3PPos || servo1PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo4PPos!=60){             // are half of the angle lowered by the diagonally opposite corner wrt the fixed corner.
          servo4Pos=servo4PPos-2;
          servo2Pos=servo2PPos-1;
          servo3Pos=servo3PPos-1;
          servo03.write(servo3Pos);
          servo02.write(servo2Pos);
          servo04.write(servo4Pos);
          servo3PPos=servo3Pos;
          servo2PPos=servo2Pos;
          servo4PPos=servo4Pos;
          delay(15);
       }
        delay(3000);
     }
  
      else{
        Serial.println("Turn Down (S)");
        if (servo4PPos<servo2PPos || servo3PPos<servo1PPos){ //setting from W or SW to S
          int val1 = servo1PPos;
          int val4 = servo4PPos;
          while (servo3PPos!=val1 && servo2PPos!=val4) {
            servo3Pos=servo3PPos+1;
            servo2Pos=servo2PPos-1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        if (servo4PPos!=servo2PPos || servo3PPos!=90 || servo1PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo2PPos!=60 && servo4PPos!=60 && servo2PPos==servo4PPos && servo1PPos==servo3PPos){
          servo2Pos=servo2PPos-2;
          servo4Pos=servo4PPos-2;
          servo02.write(servo2Pos);
          servo04.write(servo4Pos);
          servo2PPos=servo2Pos;
          servo4PPos=servo4Pos;
          delay(15);
        }
        delay(3000);
      }
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  else if (right_sensor > left_sensor + deadband){ //possibly go right
    if(above_sensor > below_sensor + deadband){
      double angle = atan(above_sensor/ (right_sensor));
      if(angle < 0.39269908){
        Serial.println("Turn right (E)");
        if (servo1PPos>servo2PPos || servo3PPos>servo4PPos){ //setting from NE or N to E (greater than sign assuming servo1PPos is towards 120 deg and servo2PPos is at 90 deg)
          int val1 = servo1PPos ; 
          int val4 = servo4PPos ; 
          while (servo2PPos!=val1 && servo3PPos!=val4) { 
            servo3Pos=servo3PPos-1;
            servo2Pos=servo2PPos+1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        if (servo1PPos!=servo2PPos || servo3PPos!=90 || servo4PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo1PPos!=120 && servo2PPos!=120 && servo1PPos==servo2PPos && servo3PPos==servo4PPos){ // for E
          servo1Pos=servo1PPos+2;
          servo2Pos=servo2PPos+2;
          servo01.write(servo1Pos);
          servo02.write(servo2Pos);
          servo1PPos=servo1Pos;
          servo2PPos=servo2Pos;
          delay(15);
        }
        delay(3000);
      }
      
      else if(angle > 0.39269908 && angle < 0.39269908+(PI/4)){
        Serial.println("Turn up-right (NE)");
        if (servo3PPos==servo4PPos && servo1PPos>servo3PPos){ //setting from E to NE
          int val1 = servo1PPos;
          int val2 = (90+val1)/2;
          while (servo2PPos!=val2){
            servo3Pos=servo3PPos+1;
            servo2Pos=servo2PPos-1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        else if (servo3PPos==servo1PPos && servo1PPos>servo2PPos){ //setting from N to NE
          int val1 = servo1PPos;
          int val2 = (90+val1)/2;
          while (servo2PPos!=val2){
            servo3Pos=servo3PPos-1;
            servo2Pos=servo2PPos+1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        if (servo1PPos<=servo2PPos || servo1PPos<=servo3PPos || servo4PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo1PPos!=120){             // are half of the angle lowered by the diagonally opposite corner wrt the fixed corner.
          servo1Pos=servo1PPos+2;
          servo2Pos=servo2PPos+1;
          servo3Pos=servo3PPos+1;
          servo03.write(servo3Pos);
          servo01.write(servo1Pos);
          servo02.write(servo2Pos);
          servo3PPos=servo3Pos;
          servo1PPos=servo1Pos;
          servo2PPos=servo2Pos;
          delay(15);
        }
        delay(3000);
      }
      
      else{
        Serial.println("Turn Up (N)");
        if (servo1PPos>servo3PPos || servo2PPos>servo4PPos){ //setting from NE or E to N
          int val1 = servo1PPos;
          int val4 = servo4PPos;
          while (servo3PPos!=val1 && servo2PPos!=val4) {
            servo3Pos=servo3PPos+1;
            servo2Pos=servo2PPos-1;
            servo03.write(servo3Pos);
            servo02.write(servo2Pos);
            servo3PPos=servo3Pos;
            servo2PPos=servo2Pos;
            delay(15);
          }
        }
        if (servo3PPos!=servo1PPos || servo4PPos!=90 || servo2PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo1PPos!=120 && servo3PPos!=120 && servo1PPos==servo3PPos && servo2PPos==servo4PPos){
          servo1Pos=servo1PPos+2;
          servo3Pos=servo3PPos+2;
          servo01.write(servo1Pos);
          servo03.write(servo3Pos);
          servo1PPos=servo1Pos;
          servo3PPos=servo3Pos;
          delay(15);
        }
        delay(3000);
      }
    }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
  
    else{
      double angle = atan(below_sensor/ (right_sensor));
      if(angle < 0.39269908){
        Serial.println("Turn right (E)");
        if (servo2PPos>servo1PPos || servo4PPos>servo3PPos){ //setting from SE or S to E (greater than sign assuming servo1PPos is towards 120 deg and servo2PPos is at 90 deg)
          int val2 = servo2PPos ; 
          int val3 = servo3PPos ; 
          while (servo1PPos!=val2 && servo4PPos!=val3) { 
            servo4Pos=servo4PPos-1;
            servo1Pos=servo1PPos+1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        if (servo1PPos!=servo2PPos || servo3PPos!=90 || servo4PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo1PPos!=120 && servo2PPos!=120 && servo1PPos==servo2PPos && servo3PPos==servo4PPos){ // for E
          servo1Pos=servo1PPos+2;
          servo2Pos=servo2PPos+2;
          servo01.write(servo1Pos);
          servo02.write(servo2Pos);
          servo1PPos=servo1Pos;
          servo2PPos=servo2Pos;
          delay(15);
        }
        delay(3000);
      }

      else if(angle > 0.39269908 && angle < 0.39269908+(PI/4)){
        Serial.println("Turn down-right (SE)");
        if (servo3PPos==servo4PPos && servo1PPos>servo3PPos){ //setting from E to SE
          int val2 = servo2PPos;
          int val1 = (90+val2)/2;
          while (servo1PPos!=val1){
            servo4Pos=servo4PPos+1;
            servo1Pos=servo1PPos-1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        else if (servo3PPos==servo1PPos && servo2PPos>servo1PPos){ //setting from S to SE
          int val2 = servo2PPos;
          int val1 = (90+val2)/2;
          while (servo1PPos!=val1){
            servo4Pos=servo4PPos-1;
            servo1Pos=servo1PPos+1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        if (servo2PPos<=servo1PPos || servo2PPos<=servo4PPos || servo3PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo2PPos!=120){             // are half of the angle lowered by the diagonally opposite corner wrt the fixed corner.
          servo2Pos=servo2PPos+2;
          servo1Pos=servo1PPos+1;
          servo4Pos=servo4PPos+1;
          servo04.write(servo4Pos);
          servo01.write(servo1Pos);
          servo02.write(servo2Pos);
          servo4PPos=servo4Pos;
          servo1PPos=servo1Pos;
          servo2PPos=servo2Pos;
          delay(15);
        }
        delay(3000);
      }
      
      else{
        Serial.println("Turn Down (S)");
        if (servo2PPos>servo4PPos || servo1PPos>servo3PPos){ //setting from SE or E to S
          int val2 = servo2PPos;
          int val3 = servo3PPos;
          while (servo4PPos!=val2 && servo1PPos!=val3) {
            servo4Pos=servo4PPos+1;
            servo1Pos=servo1PPos-1;
            servo04.write(servo4Pos);
            servo01.write(servo1Pos);
            servo4PPos=servo4Pos;
            servo1PPos=servo1Pos;
            delay(15);
          }
        }
        if (servo2PPos!=servo4PPos || servo1PPos!=90 || servo3PPos!=90){ //setting from other random direction to Reset
          resetservo();
        }
        while (servo2PPos!=120 && servo4PPos!=120 && servo2PPos==servo4PPos && servo1PPos==servo3PPos){
          servo2Pos=servo2PPos+2;
          servo4Pos=servo4PPos+2;
          servo02.write(servo2Pos);
          servo04.write(servo4Pos);
          servo2PPos=servo2Pos;
          servo4PPos=servo4Pos;
          delay(15);
        }
        delay(3000);
      }
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  else if (above_sensor > below_sensor + deadband){
    Serial.println("Turn Up (N)");
    resetservo();
    while (servo1PPos!=60 && servo3PPos!=60 && servo1PPos==servo3PPos && servo2PPos==servo4PPos){
          servo1Pos=servo1PPos-2;
          servo3Pos=servo3PPos-2;
          servo01.write(servo1Pos);
          servo03.write(servo3Pos);
          servo1PPos=servo1Pos;
          servo3PPos=servo3Pos;
          delay(15);
        }
    delay(3000);
  }
  else if (below_sensor > above_sensor + deadband){
    Serial.println("Turn Down (S)");
    resetservo();
    while (servo2PPos!=120 && servo4PPos!=120 && servo2PPos==servo4PPos && servo1PPos==servo3PPos){
          servo2Pos=servo2PPos+2;
          servo4Pos=servo4PPos+2;
          servo02.write(servo2Pos);
          servo04.write(servo4Pos);
          servo2PPos=servo2Pos;
          servo4PPos=servo4Pos;
          delay(15);
        }
    delay(3000);
  }

  /*if (above_sensor > below_sensor + deadband){ //possibly go left
    if(right_sensor > left_sensor + deadband){
      double angle = atan(above_sensor/ (right_sensor));
      if(angle < PI/6){
        Serial.println("Turn right (E)");
      }
      else if(angle > PI/6 && angle < PI/3){
        Serial.println("Turn up-right (NE)");
      }
      else{
        Serial.pntln("Turn Up (N)");
      }
    }
    else{
      double angle = atan(below_sensor/ (right_sensor));
      if(angle < PI/6){
        Serial.println("Turn right (E)");
      }
      else if(angle > PI/6 && angle < PI/3){
        Serial.println("Turn up-right (SE)");
      }
      else{
        Serial.println("Turn Down (S)");
      }
    }
  }
  else if (right_sensor > left_sensor + deadband) Serial.println("Turn right");
  else if (right_sensor > left_sensor + deadband) Serial.println("Turn right");
  else if (right_sensor > left_sensor + deadband) Serial.println("Turn right");*/

  else Serial.println("Don't turn");
  Serial.println(" ");
  delay(1000);
   } // END OF AUTO IF STATEMENT 

   else{ //manual mode if not in auto
    //Serial.println("in manual");
    //usedData = true;
    if(!direct.equals("")){ //looks at begining of string to see which motor is chosen
            Serial.print("Moving in direction: ");
            Serial.println(direct);
       }
    }

   String more = dataIn.substring(location); // will create a string starting with % and possible more after (what we are testing for)
   if(more.equals("%")){
      dataIn = ""; //reset dataIn variable
      direct = "";
    }
    else{
      dataIn = more.substring(1); //keep other data after this instruction
      direct = "";
      }
      
     
}
