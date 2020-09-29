import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ModularState<SplashScreen, SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: Center(
        child: Image(image: AssetImage('assets/logoName.png')),
      ),
    );
  }
}
