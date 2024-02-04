import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';
import 'globals.dart';

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
                  Container( //NW Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:150, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "NW",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving Northwest');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                  Container( //N Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:150, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "N",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving North');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                  Container( //NE Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:150, bottom: 15),
                    child: ElevatedButton(
                      child: const Text(
                        "NE",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving Northeast');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                ] //children
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container( //SW Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:15, bottom: 150),
                    child: ElevatedButton(
                      child: const Text(
                        "SW",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving Southwest');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                  Container( //S Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:15, bottom: 150),
                    child: ElevatedButton(
                      child: const Text(
                        "S",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving South');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                  Container( //SE Button
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left:15, right:15, top:15, bottom: 150),
                    child: ElevatedButton(
                      child: const Text(
                        "SE",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black, fontSize:30),
                      ),
                      onPressed: () {
                        print('Moving Southeast');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  )
                ] //children
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container( //HELP BUTTON
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: const Text(
                      "Help",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.black, fontSize:15),
                    ),
                    onPressed: () {
                      print('Switching to Help Info Page');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.yellow1,
                    ),
                  ),
                ),
              ],
            ),

            Expanded( //Return to homepage button
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