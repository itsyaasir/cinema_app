import 'package:cinema_app/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplash(
        imagePath: "images/splash.png",
        type: AnimatedSplashType.StaticDuration,
        duration: 2000,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: MovieScreen(),
        ),
      ),
    );
  }
}
