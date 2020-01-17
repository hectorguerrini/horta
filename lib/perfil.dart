import 'package:flutter/material.dart';

class PerfilScreenPage extends StatefulWidget { 
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreenPage> {
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;  
    return Scaffold(
        appBar: AppBar(
          title: Text('Meu Perfil'),
        ),
        body: Container(     
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),     
          
          child: ListView(
                  
            children: <Widget>[

              SizedBox(
                width: 100,
                height: 100,
                child: Text(
                  'Hector Guerrini Herrera',
                  style: TextStyle(
                    fontSize: 24,
                    backgroundColor: Colors.grey,                
                  ),
                  textAlign: TextAlign.center,

                ),
              ),
              Divider(),              
            ]
          )
        ),
      );
  }
}

