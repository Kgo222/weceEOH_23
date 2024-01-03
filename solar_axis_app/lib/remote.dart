import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';

class Remote extends StatelessWidget {
  const Remote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motor Control Remote"),
        backgroundColor: AppColors.blue2,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      child: Text("Up"),
                      onPressed: () {
                        print('Moving Up');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
                      ),
                    ),
                  ),
                ] //children
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container( //Left BUTTON
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      child: Text("Left"),
                      onPressed: () {
                        print('Moving Left');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
                      ),
                    ),
                  ),
                  Container( //Right BUTTON
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      child: Text("Right"),
                      onPressed: () {
                        print('Moving Right');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
                      ),
                    ),
                  ),
                ] //children
            ),
            Row( //DOWN BUTTON
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      child: Text("Down"),
                      onPressed: () {
                        print('Moving Down');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
                      ),
                    ),
                  ),
                ] //children
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: EdgeInsets.all(100),
                    alignment: Alignment.center,
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
                ] //children
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}