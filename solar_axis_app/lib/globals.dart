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
double hourAngle = 15*(12-currTime);
int n = 96;

double deltaRads = 0.323990734203;
double LatRads = 0.698131700798;
double hourRads = hourAngle*(3.1415926535897932/180);
double A = 1116.49829459;
double k = 0.199195396933;
double sinB = cos(LatRads)*cos(deltaRads)*cos(hourRads) - sin(LatRads)*sin(deltaRads);

//Maybe add color variables that change when the motor button is pressed in the remote screen