#include <SoftwareSerial.h>

SoftwareSerial Bluetooth(0,1); //Arduino(RX,TX) to HM-10 Bluetooth(TX,RX)
String dataIn = "";
String direct = "";

void setup() {
  // put your setup code here, to run once:
  Bluetooth.begin(9600);
  Bluetooth.setTimeout(1);
  Serial.begin(9600);
  Serial.println("begin");

}

void loop() {
  // put your main code here, to run repeatedly:
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
         int location = dataIn.indexOf("|");
         direct = dataIn.substring(location+1,dataIn.length()-1);  //gets only direction from data
         Serial.print("direction:");
         Serial.println(direct);
      
      //USING THE DATA
       if(dataIn.startsWith("1")){ //looks at begining of string to see which motor is chosen
            Serial.println("motor: 1");
       }
       else if(dataIn.startsWith("2")){ //looks at begining of string to see which motor is chosen
              Serial.println("motor: 2");
       }
       else if(dataIn.startsWith("3")){ //looks at begining of string to see which motor is chosen
              Serial.println("motor: 3");
       }
       else if(dataIn.startsWith("4")){ //looks at begining of string to see which motor is chosen
              Serial.println("motor: 4");
       }
       else if(dataIn.startsWith("0")){ //looks at begining of string to see which motor is chosen
              if(direct.equals("auto")){
                Serial.println("return to automatic adjusting");
              }
              if(direct.equals("manual")){
                Serial.println("enter manual control");
              }
       }
        dataIn = ""; //reset dataIn variable
     }
    
     
  }
}
