import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'clientes_controller.dart';

class ClientesPage extends StatefulWidget {
  final String title;
  const ClientesPage({Key key, this.title = "Clientes"}) : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState
    extends ModularState<ClientesPage, ClientesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("cliente page"),
      ),
    );
  }
}
