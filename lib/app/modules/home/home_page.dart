import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:horta/app/modules/agricultor/agricultor_module.dart';
import 'package:horta/app/modules/clientes/clientes_module.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "É da Horta"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  //EXCLUIR DEPOIS DO TESTE

  //EXCLUIR ACIMA
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return PageView(
          onPageChanged: controller.pageChanged,
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            if (controller.getIsAgricultor) ...[
              RouterOutlet(module: AgricultorModule()),
              RouterOutlet(module: ClientesModule())
            ],
            if (!controller.getIsAgricultor)
              //TESTE!!
              FlatButton(
                child: Text('Chat List Page'),
                onPressed: () => Modular.to.pushReplacementNamed('/chatRoom'),
              )
          ],
        );
      }),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            if (controller.getIsAgricultor)
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.carrot), title: Text('Horta')),
            if (controller.getIsAgricultor)
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Clientes')),
            if (!controller.getIsAgricultor)
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
            !(controller.isLogged)
                ? BottomNavigationBarItem(
                    icon: Icon(FontAwesome5.sign_in_alt), title: Text('Login'))
                : BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), title: Text('Perfil'))
          ],
          onTap: (value) {
            controller.bottomTapped(value);
            if (value == 1 && !controller.isLogged) {
              controller.login();
            } else if ((value == 2) && controller.isLogged) {
              Modular.to.pushNamed('/perfil');
            }
          },
          currentIndex: controller.getIndexPage,
        );
      }),
    );
  }
}
