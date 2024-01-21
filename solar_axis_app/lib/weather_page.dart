import 'package:flutter/material.dart';
import 'package:solar_axis_app/theme.dart';
import 'theme.dart';
import 'globals.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  State<WeatherInfo> createState() => _WeatherPageState();
}
class _WeatherPageState extends State<WeatherInfo> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Information"),
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
                      'Why solar energy?',
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
                'Sustainable and cost-effective'
                '\n\nVariables that affect Solar Power:'
                    '\n\n Sun intensity'
                    '\n Overcast/Cloudiness'
                    '\n Temperature: $temperature°F'
                '\n\n Following the sun \n(insert animated graphic + align it)',
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
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
            GestureDetector(
              onTap: () {
              setState(() {
              isClicked = !isClicked;
              });
            },
            child: Center(
              child: Container(
                width: 400.0,
                height: 100.0,
                color: Colors.blue,
              child: AnimatedAlign(
                alignment: isClicked ? Alignment.bottomLeft : Alignment.bottomRight,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: const  Image(
                  image: NetworkImage('https://pngfre.com/wp-content/uploads/sun-50-1024x1024.png')
                  )
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