import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';
import 'globals.dart';

class HelpRemote extends StatefulWidget {
  const HelpRemote({Key? key}) : super(key: key);

  @override
  State<HelpRemote> createState() => _HelpRemotePageState();
}
class _HelpRemotePageState extends State<HelpRemote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help - Remote Control"),
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
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'The functions of remote control screen:\n\n'
                    'Select NW, N, NE, SW, S, SE to change the direction of the panel',
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
                    child: const Text("Back to RemotePage"),
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