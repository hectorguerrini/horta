import 'package:flutter/material.dart';
import 'login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',               
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MainApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginScreenPage(),
      }, 
    );
  }
}

class MainApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void goLogin() {
    Navigator.pushNamed(
      context,
      '/login'
    );

  }
  @override
  Widget build(BuildContext context) {      
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome')
      ),
      body: Center(        
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),       
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[            
              Text(
                'Go Login',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              RaisedButton(
                onPressed: goLogin,
                child: Text('Login'),              
              )
            ],
          ),
        )
      )
    );
  }
}

