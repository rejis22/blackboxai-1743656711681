import 'package:flutter/material.dart';
import 'package:zero2robotics/intro_page.dart';
import 'package:zero2robotics/map_page.dart';
import 'package:zero2robotics/control_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero2Robotics',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.cyanAccent,
        ),
      ),
      initialRoute: '/intro',
      routes: {
        '/intro': (context) => const IntroPage(),
        '/map': (context) => const MapPage(),
        '/control': (context) => const ControlPage(),
      },
    );
  }
}