import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stopwatch/setting_screen.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  _StopWatchScreenState createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  bool isVisible = true;
  String time = "00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);
  String startButton =" ${"Start".tr()}";

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    setState(() {
      time =
          "${swatch.elapsed.inHours.toString().padLeft(2, '0')}:${(swatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}";
    });
  }

  void startWatch() {
    setState(
      () {
        isVisible = !isVisible;
      },
    );
    swatch.start();
    startTimer();
  }

  void stopwatch() {
    setState(
      () {
        isVisible = !isVisible;
      },
    );
    swatch.stop();
    startButton = "Continue".tr();
  }

  void restartWatch() {
    setState(
      () {},
    );
    swatch.reset();
    time = "00:00:00";
    startButton = "Start".tr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.deepPurpleAccent,
        title:  Row(
          children: [
            Text(
              "AppName".tr(),
            ),
            Expanded(child: SizedBox()),

            // if mode == dark ?


            // :

            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingScreen() ));
                },
                child: Icon(Icons.settings))
          ],
        ),
      ),
      //backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          ShapeOfView(
            height: 300,
            width: 300,
            shape: PolygonShape(numberOfSides: 9),
            child: Container(
             // color: Colors.blueGrey,
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    // color: Colors.deepPurple[900],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              isVisible
                  ? ElevatedButton(
                      onPressed: startWatch,
                      child: Text(
                        startButton,
                        style: const TextStyle(
                         // color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: const ButtonStyle(
                       // backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                      ),
                      onPressed: stopwatch,
                      child:  Text(
                        "Stop".tr(),
                        style: TextStyle(
                         // color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
              ElevatedButton(
                onPressed: restartWatch,
                child: Container(
                 // height: 40,
                 // width: 90,
                  alignment: Alignment.center,
                  // decoration: const BoxDecoration(
                  //   color: Colors.deepPurple,
                  // ),
                  child:  Text(
                    "Restart".tr(),
                    style: TextStyle(
                     // color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}