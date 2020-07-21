import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:horta/models/horta_model.dart';
import 'package:horta/screens/consumidor/horta_controller.dart';
import 'package:provider/provider.dart';

class ListaHortasScreenPage extends StatefulWidget {
  @override
  _ListaHortasScreenState createState() => _ListaHortasScreenState();
}

class _ListaHortasScreenState extends State<ListaHortasScreenPage> {
  @override
  Widget build(BuildContext context) {
    final HortaController hortaController =
        Provider.of<HortaController>(context);
    return Observer(builder: (_) {
      if (hortaController.listaHortas.hasError) {
        return Center(
          child: RaisedButton(
            onPressed: hortaController.getListaHortas,
            child: Text('Error'),
          ),
        );
      }
      if (hortaController.listaHortas.data == null) {
        return Center(child: CircularProgressIndicator());
      }

      List<HortaModel> lista = hortaController.listaHortas.data;

      return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: lista.length,
          itemBuilder: (_, index) {
            return ListTile(
              // leading: Icon(IconsApp.user),
              title: Text(
                lista[index].nomeHorta,
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                lista[index].minhaHistoria,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                hortaController.setDetalheHorta(lista[index]);
                Navigator.pushNamed(context, '/detalhe');
              },
            );
          });
    });
  }
}
