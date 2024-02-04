// Global variables
import 'package:flutter_blue/flutter_blue.dart';
import 'package:solar_axis_app/bluetooth_handler.dart';
import "homepage.dart";

late final BLEHandler bleHandler;

double current = 10;
double voltage = 20;
double temperature = 45;
String motor = "1";
double currTime = 0;
List<int> response = [];

//Maybe add color variables that change when the motor button is pressed in the remote screen