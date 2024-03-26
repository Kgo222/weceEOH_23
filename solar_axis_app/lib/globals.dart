// Global variables
// Not sure if this is best practice -- there may be a better way
/*import 'package:flutter_blue/flutter_blue.dart';
import 'package:wece_glasses/device_screens/screen_handler.dart';
import 'package:wece_glasses/bluetooth_handler.dart';
import 'package:location/location.dart';

late final DeviceScreenHandler deviceScreenHandler = DeviceScreenHandler();
//late final BLEHandler bleHandler = BLEHandler();
late final BLEHandler bleHandler;
final Location location = Location();*/
import 'dart:math';

double current = 10;
double voltage = 20;
double temperature = 45;
String motor = "1";
double test = 0;
double currTime= 0;
double A = 1116.49829459;
double k = 0.199195396933;
int n = 96;
double area = 0.052832*0.029972; //2.08''*1.18'';
double latitude = 40; //degrees

double hourAngle = 15*(12-currTime);
double delta = 23.45*sin((360/365)*(n-81)*(pi/180)); //degrees
double deltaRads = delta* (pi/180); //radians
double latRads = latitude*(pi/180); //radians
double hourRads = hourAngle*(pi/180); //radians

double sinB = cos(latRads)*cos(deltaRads)*cos(hourRads) + sin(latRads)*sin(deltaRads);
double m = sqrt(((708*sinB)*(708*sinB))+1417) - (708*sinB);
double ib = A*pow(e,-1*k*m); //W per m^2

String power = (ib*area).toStringAsFixed(3);

//Maybe add color variables that change when the motor button is pressed in the remote screen