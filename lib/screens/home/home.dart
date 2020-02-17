import 'package:flutter/material.dart';
import 'package:horta/services/auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _auth = AuthService();
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async { 
               await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Sair'),
              textColor: Colors.white,
            )
          ],
        ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/perfil');
                    },
                    icon: Icon(Icons.people),
                    color: Colors.orange[600],
                    iconSize: 48,
                  ),
                  Expanded(
                    child: Container(
                      height: size.height * 0.10,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Column(                        
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Meu Perfil', style: TextStyle(fontSize: 20),),
                          Text('Suas Informações gerais', style: TextStyle(fontSize: 14, color: Colors.grey),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(),
              
            ],
          ),
        ));
  }
}