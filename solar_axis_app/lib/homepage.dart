import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  double setTime= 0;
  bool isClicked = false;

  void _incrementCounter() {
    setState(() {
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
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
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
                    margin: EdgeInsets.all(15),
                    child: Image.asset(
                      'images/sunflower.png',
                      width: 400,
                      height: 225,
                      fit: BoxFit.cover,
                    ),
                  ),
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Expanded(
                    child: Slider(
                      value: setTime,
                      max: 23,
                      divisions: 23,
                      label: setTime.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          setTime = value;
                        });
                      },
                    ),
                  )
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text("Power"),
                      onPressed: () {
                        print('you clicked me');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const PowerInfo();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text("Weather"),
                      onPressed: () {
                        print('you clicked me');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text("Reset"),
                      onPressed: () {
                        print('you clicked me');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.orange,
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
                        print('you clicked me');
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
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      border: Border.all(width: 0, color: AppColors.orange),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Power/Renewable Fact of the Day',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                RichText(
                  text: TextSpan(
                    text: 'test',
                    style: TextStyle(
                        color: AppColors.pink, fontSize: 18),
                  ),
                  textAlign: TextAlign.center,
                ),
              ], //children
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  isClicked = !isClicked;
                });
              },
              child: Container(
                color: AppColors.orange,
                padding: const EdgeInsets.all(8),
                // Change button text when clicked.
                child: Text(isClicked ? 'first fact' : 'second fact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
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