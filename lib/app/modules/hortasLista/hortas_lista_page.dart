import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'hortas_lista_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../hortasLista/horta_item.dart';
import '../../shared/components/textos/titulo_widget.dart';
import '../agricultorPagina/agricultor_pagina_controller.dart';

class HortasListaPage extends StatefulWidget {
  final String title;
  const HortasListaPage({Key key, this.title = "HortasLista"})
      : super(key: key);

  @override
  _HortasListaPageState createState() => _HortasListaPageState();
}

class _HortasListaPageState
    extends ModularState<HortasListaPage, HortasListaController> {
  var hortasAparecer = [];
  @override
  Widget build(BuildContext context) {
    controller.getHortas();
    controller.chamarTodasDistancias();
    return Container(
      child: Column(
        children: [
          Titulo("Escolha uma horta próxima a você!"),
          Observer(builder: (_) {
            List<HortaModel> hortas = controller.listaHortas.data;

            if (!controller.aparecer) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: hortas.length,
                    itemBuilder: (BuildContext context, int index) {
                      HortaModel horta = hortas[index];
                      return GestureDetector(
                        onTap: () => Modular.to
                            .pushNamed('/agricultorPagina', arguments: horta),
                        child: HortaItem(
                            horta.nomeHorta,
                            horta.nomeHorta,
                            "https://img.freepik.com/fotos-gratis/gotas-de-oleo-na-imagem-abstrata-padrao-psicodelico-de-agua_23-2148290141.jpg?size=626&ext=jpg",
                            5),
                      );
                    }),
              );
            }
          }),
        ],
      ),
    );
  }
}
