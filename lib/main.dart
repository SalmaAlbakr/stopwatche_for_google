import 'package:flutter/material.dart';
import 'package:stopwatche_for_google/stop_watch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StopWatchScreen(),
    );
  }
}

