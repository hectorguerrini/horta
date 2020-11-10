import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return OKToast(
              duration: Duration(seconds: 3),
              dismissOtherOnShow: true,
              position: ToastPosition.center,
              radius: 10,
              child: MaterialApp(
                navigatorKey: Modular.navigatorKey,
                title: 'É da Horta',
                theme: ThemeData(
                    primaryColor: Color.fromRGBO(71, 127, 32, 1),
                    primaryColorDark: Color.fromRGBO(21, 82, 0, 1),
                    primaryColorLight: Color.fromRGBO(119, 175, 77, 1),
                    accentColor: Color.fromRGBO(241, 136, 37, 1)),
                initialRoute: '/',
                onGenerateRoute: Modular.generateRoute,
              ),
            );
          }
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
