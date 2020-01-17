import 'package:flutter/material.dart';
import 'login.dart';
import 'perfil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/perfil',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MainApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginScreenPage(),
        '/perfil': (context) => PerfilScreenPage()
      },
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void goLogin() {
    Navigator.pushNamed(context, '/perfil');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Welcome')),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    onPressed: goLogin,
                    icon: Icon(Icons.people),
                    color: Colors.orange[600],
                    iconSize: 48,
                  ),
                  Expanded(
                    child: Container(
                      height: size.height * 0.10,
                      alignment: Alignment.center,
                      color: Colors.cyan,
                      child: Text('teste'),
                    ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    onPressed: goLogin,
                    icon: Icon(Icons.people),
                    color: Colors.orange[600],
                    iconSize: 48,
                  ),
                  Expanded(
                    child: Container(
                      height: size.height * 0.10,
                      alignment: Alignment.center,
                      color: Colors.cyan,
                      child: Text('teste'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
