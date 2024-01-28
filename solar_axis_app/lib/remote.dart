import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';
import 'globals.dart';
import "bluetooth_handler.dart";

class Remote extends StatefulWidget {
  const Remote({Key? key}) : super(key: key);

  @override
  State<Remote> createState() => _RemotePageState();
}
class _RemotePageState extends State<Remote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Motor Control Remote"),
        backgroundColor: AppColors.blue2,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left:20, top:10),
              // Change button text when clicked.
              child: Text(
                'Selected Motor: $motor',
                textAlign: TextAlign.left,
                style: const TextStyle(color: AppColors.black,fontSize:25),
              ),
            ),//Container
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(//Motor 1
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:10, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "1",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Motor 1');
                        motor = '1';
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                  Container( //Motor 2
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:10, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "2",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Motor 2');
                        motor = '2';
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                  Container( //Motor 3
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:10, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "3",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Motor 3');
                        motor = '3';
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                  Container( //Motor 4
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:10, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "4",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Motor 4');
                        motor = '4';
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                ] //children
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container( //UP Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:150, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving Up');
                        bleHandler.bluetoothWrite(motor,"up");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                  Container( //Down Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:150, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "DOWN",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving Down');
                        bleHandler.bluetoothWrite(motor,"down");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                ] //children
            ),

            Expanded( //Return to homepage button
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    child: const Text("Back to HomePage"),
                    onPressed: () {
                      bleHandler.bluetoothWrite("0","auto");
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