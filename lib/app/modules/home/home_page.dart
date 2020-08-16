import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              if (controller.isAgricultor)
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), title: Text('Menu')),
              !(controller.isLogged)
                  ? BottomNavigationBarItem(
                      icon: Icon(FontAwesome5.sign_in_alt),
                      title: Text('Login'))
                  : BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle), title: Text('Perfil'))
            ],
            onTap: (value) {
              if (value == 1 && controller.isAgricultor) {
                Modular.to.pushNamed('/menuAgricultor');
              }
              if (value == 1 && !controller.isLogged) {
                Modular.to.pushNamed('/auth');
              }
              if ((value == 1 || value == 2) && controller.isLogged) {
                Modular.to.pushNamed('/perfil');
              }
            });
      }),
    );
  }
}
