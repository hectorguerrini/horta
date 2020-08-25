import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      duration: Duration(seconds: 3),
      dismissOtherOnShow: true,
      position: ToastPosition.center,
      radius: 10,
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Slidy',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
