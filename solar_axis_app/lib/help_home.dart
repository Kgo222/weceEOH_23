import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';
import 'globals.dart';

class HelpHome extends StatefulWidget {
  const HelpHome({Key? key}) : super(key: key);

  @override
  State<HelpHome> createState() => _HelpHomePageState();
}
class _HelpHomePageState extends State<HelpHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help - Home"),
        backgroundColor: AppColors.blue2,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.yellow1,
                      border: Border.all(width: 8, color: AppColors.yellow2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // Change button text when clicked.
                    child: const Text(
                      'Help',
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
                'The functions of each button in home screen:\n\n'
                    'Slider: control time of day to estimate power\n\n'
                    'Power: get power estimation\n\n'
                    'Weather: get weather information\n\n'
                    'Current Hour: set the slider to current hour\n\n'
                    'Remote Control: control each motor\n\n'
                    'Fun Fact: switch to a new fact of the day\n\n',
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style: TextStyle(color: AppColors.black, fontSize:23),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    child: const Text("Back to HomePage"),
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