import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';
import 'globals.dart';

class PowerInfo extends StatefulWidget {
  const PowerInfo({Key? key}) : super(key: key);

  @override
  State<PowerInfo> createState() => _PowerPageState();
}
class _PowerPageState extends State<PowerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Power Information"),
        backgroundColor: AppColors.blue2,
      ),
      body: Center(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                     Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.yellow1,
                      border: Border.all(width: 8, color: AppColors.yellow2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // Change button text when clicked.
                    child: const Text(
                      'Power Calculation',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(color: AppColors.black, fontSize:45),
                    ),
                  ),
                ] //children
            ),
             Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    'Standard Solar Panel Conditions'
                    '\n at Time $currTime:00'
                        '\n\n Latitude = 40°'
                    '\n 15° SE Facing'
                        '\n β = Tilt Angle: 40°'
                    '\nHour angle = 15(12-$currTime) = $hourAngle'
                    '\n\n Direct Beam Solar Radiation: $ib W/m^2 '
                    'Area of one Panel: ',
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.black, fontSize:15),
                  ),
                  ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    //margin: const EdgeInsets.all(15),
                    child: Image.asset(
                      'images/SunDiagram.png',
                      width: 400,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      child: Text("Back to HomePage"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.brown,
                        onPrimary: AppColors.white,
                      ),
                    ),
                ),
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
