import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';

class PowerInfo extends StatelessWidget {
  const PowerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Power Information"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text("Back to HomePage"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
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