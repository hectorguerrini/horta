import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:horta/app/modules/agricultor/agricultor_module.dart';
import 'package:horta/app/modules/clientes/clientes_module.dart';

import 'package:horta/app/modules/hortasLista/hortas_lista_module.dart';


import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "É da Horta"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

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

              RouterOutlet(module: HortasListaModule())

          ],
        );
      }),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            if (controller.getIsAgricultor)
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.carrot), label: 'Horta'),
            if (controller.getIsAgricultor)
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Clientes'),
            if (!controller.getIsAgricultor)
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            !(controller.isLogged)
                ? BottomNavigationBarItem(
                    icon: Icon(FontAwesome5.sign_in_alt), label: 'Login')
                : BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Perfil')
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
/*
class LocationPage extends StatefulWidget {
  Position _position;
  StreamSubscription<Position> _positionStream;
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    super.initState();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
        _positionStream = Geolocator().getPositionStream(locationOptions).listen((Position g)){});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
*/
