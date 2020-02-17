
import 'package:horta/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:horta/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:horta/models/user.dart';
class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    return user == null ? Authenticate() : HomeScreen();
  }
}
