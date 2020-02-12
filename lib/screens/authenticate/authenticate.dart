import 'package:flutter/material.dart';
import 'package:horta/screens/authenticate/sign_in.dart';


class Authenticate extends StatefulWidget {
  @override
   AuthenticateState createState() =>  AuthenticateState();
}

class AuthenticateState extends State <Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}