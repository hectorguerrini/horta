import 'package:flutter/material.dart';
import 'package:horta/screens/authenticate/login.dart';
import 'package:horta/screens/authenticate/register.dart';




class Authenticate extends StatefulWidget {
  @override
   AuthenticateState createState() =>  AuthenticateState();
}

class AuthenticateState extends State <Authenticate> {

bool showSignIn = true;
void toggleView(){
  setState(() => showSignIn = !showSignIn );
}

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return LoginScreenPage(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }
}