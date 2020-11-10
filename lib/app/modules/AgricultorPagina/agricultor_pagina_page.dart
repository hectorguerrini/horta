import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';

import 'agricultor_pagina_controller.dart';

class AgricultorPaginaPage extends StatefulWidget {
  final String title;
  const AgricultorPaginaPage({Key key, this.title = "AgricultorPagina"})
      : super(key: key);

  @override
  _AgricultorPaginaPageState createState() => _AgricultorPaginaPageState();
}

class _AgricultorPaginaPageState
    extends ModularState<AgricultorPaginaPage, AgricultorPaginaController> {
  //use 'controller' variable to access controller
  String fotoPerfil;
  String nome = "Alisson";
  double dist = 5;

  @override
  Widget build(BuildContext context) {
    HortaModel horta = ModalRoute.of(context).settings.arguments;
    String pagamentos = "Aceitamos ";
    Text horario;
    if (horta.minhaHistoria != "SS") {
      horario = Text(
        horta.fechamento.toString(),
        //distancia.toString() + " km",
        style: TextStyle(
          color: Colors.green,
          fontSize: 14,
        ),
      );
    } else {
      horario = Text(
        horta.fechamento.toString(),
        //distancia.toString() + " km",
        style: TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
      );
    }
    if (horta.cartaoCredito) pagamentos += "crédito ";
    if (horta.cartaoDebito) pagamentos = "débito, ";
    if (horta.dinheiro) pagamentos = "dinheiro";
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                    "https://s2.glbimg.com/osevdX4hgAbhp630e5ajLpuAkSA=/620x455/e.glbimg.com/og/ed/f/original/2018/09/20/luxo_organico_01.jpg"),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    horta.nomeHorta,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: Text(
                    nome + " • " + dist.toString() + "km",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
                    child: horario),
                Container(
                  width: 10099,
                  decoration: new BoxDecoration(color: Colors.grey[100]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 24, left: 16, bottom: 24, right: 16),
                    child: Text(horta.minhaHistoria),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    "Produtos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
