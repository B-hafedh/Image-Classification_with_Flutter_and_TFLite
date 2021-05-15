
import 'package:flutter/material.dart';
import 'package:image_classification_app/DetectionWidget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

// ignore: camel_case_types
class Spalsh_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        AnimatedSplashScreen(
          backgroundColor: Colors.blueGrey,
          curve: Curves.easeInCirc,
          splash: Image.asset('assets/eye.png'),
          nextScreen: DetectionWidget(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          pageTransitionType: PageTransitionType.fade,
          splashIconSize: 400,
        )
    );
  }
}



