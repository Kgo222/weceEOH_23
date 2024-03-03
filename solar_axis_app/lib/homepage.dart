import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'dart:async';
import 'theme.dart';
import 'power_page.dart';
import 'weather_page.dart';
import 'remote.dart';
import 'globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  double isClicked = 0;
  Timer? _timer;
  String fact = "first fact";
  double _setTime= 0;

  DateTime getTime(){
    final DateTime now = DateTime.now();
    return now;
  }


  void _incrementCounter() {
    setState(() {
      _timer = Timer.periodic(const Duration(seconds:1), (Timer t) => getTime());
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    DateTime now1 = getTime();
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: AppColors.blue2,
      ),
      backgroundColor:
        (currTime == 0) ? AppColors.hour0:
        (currTime == 1) ? AppColors.hour1:
        (currTime == 2) ? AppColors.hour2:
        (currTime == 3) ? AppColors.hour3:
        (currTime == 4) ? AppColors.hour4:
        (currTime == 5) ? AppColors.hour5:
        (currTime == 6) ? AppColors.hour6:
        (currTime == 7) ? AppColors.hour7:
        (currTime == 8) ? AppColors.hour8:
        (currTime == 9) ? AppColors.hour9:
        (currTime == 10) ? AppColors.hour10:
        (currTime == 11) ? AppColors.hour11:
        (currTime == 12) ? AppColors.hour12:
        (currTime == 12.999999999999998) ? AppColors.hour13:
        (currTime == 14) ? AppColors.hour14:
        (currTime == 15) ? AppColors.hour15:
        (currTime == 16) ? AppColors.hour16:
        (currTime == 17) ? AppColors.hour17:
        (currTime == 18) ? AppColors.hour18:
        (currTime == 19) ? AppColors.hour19:
        (currTime == 20) ? AppColors.hour20:
        (currTime == 21) ? AppColors.hour21:
        (currTime == 22) ? AppColors.hour22:
        (currTime == 23) ? AppColors.hour23: AppColors.yellow2,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Image.asset(
                      'images/flower.png',
                      width: 400,
                      height: 225,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left:20, top:10),
              // Change button text when clicked.
              child: Text(
                'Selected Hour: $_setTime',
                textAlign: TextAlign.left,
                style: const TextStyle(color: AppColors.black,fontSize:15),
              ),
            ),//Container
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Expanded(
                    child: Slider(
                      value: _setTime,
                      max: 23,
                      divisions: 23,
                      label: _setTime.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          print(_setTime);
                          _setTime = value;
                          currTime = _setTime;
                          print(_setTime);
                          currTime = _setTime;
                          if (currTime == 1) {
                            print("Yellow");
                          }
                        //  backgroundColor: checkBgColor(currTime);
                        //  bg = checkBgColor(currTime);

                        });
                      },

                    ),
                  )
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container( //POWER BUTTON
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text(
                        "Power: \n ${current*voltage} W",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.black, fontSize:15),
                      ),
                      onPressed: () {
                        print('Switching to Power Info Page');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const PowerInfo();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                  Container( //WEATHER BUTTON
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Text(
                        "Weather: \n $temperature°F",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.black, fontSize:15),
                      ),
                      onPressed: () {
                        print('Switching to Weather Info Page');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const WeatherInfo();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Text(
                        "Current Hour: \n ${now1.hour}:00",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.black, fontSize:15),
                      ),
                      onPressed: () {
                        setState(() {
                          print('Resetting');
                          DateTime now2 = getTime();
                          _setTime = 1.0 * (now2.hour);
                          print('_setTime: $_setTime');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow1,
                      ),
                    ),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text("Remote Control"),
                      onPressed: () {
                        print('Switching to Remote Control');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Remote();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow2,
                      ),
                    ),
                  ),
                ] //children
            ),
            //Click button switch
            GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  //isClicked = !isClicked;
                  isClicked = isClicked +1;
                  if(isClicked >= 5){
                    isClicked = 0;
                  }
                  if(isClicked == 0){
                    fact = 'first fact';
                  }
                  else if(isClicked == 1){
                    fact = 'second fact';
                  }
                  else if(isClicked == 2){
                    fact = 'third fact';
                  }
                  else if(isClicked == 3){
                    fact = 'fourth fact';
                  }
                  else if(isClicked == 4){
                    fact = 'fifth fact';
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  border: Border.all(width: 8, color: AppColors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),
                // Change button text when clicked.
                child: Text(
                  fact,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.black),
                ),
              ),//Container
            ),
          ],
        ),
      ),
    );
  }
}