import 'package:flutter/material.dart';
import 'package:horta/horta.dart';
import 'package:horta/localizacacao.dart';
import 'package:horta/screens/authenticate/authenticate.dart';
import 'package:horta/screens/home/home.dart';
import 'package:horta/screens/perfil/perfil.dart';
import 'package:horta/services/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Named Routes',
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => HomeScreen(),          
          // When navigating to the "/second" route, build the SecondScreen widget.          
          '/perfil': (context) => PerfilScreenPage(),
          '/localizacao': (context) => LocalizacaoScreenPage(),
          '/horta': (context) => HortaScreenPage(),    
          '/auth': (context) => Authenticate()
          
        },
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}
