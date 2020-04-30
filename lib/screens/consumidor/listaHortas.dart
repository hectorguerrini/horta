import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:horta/models/horta.dart';
import 'package:horta/models/icons_app_icons.dart';
import 'package:horta/services/consumidor.dart'; // IconsApp.(name_icon)
class ListaHortasScreenPage extends StatefulWidget {
  @override
  _ListaHortasScreenState createState() => _ListaHortasScreenState();
}

class _ListaHortasScreenState extends State<ListaHortasScreenPage> {
  List<Horta> listaHortas = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getHortas();
  }

  void getHortas() {
    List<Horta> lista = [];
    ConsumidorService().getHortas()
      .then((hortas){        
        hortas.documents.forEach((h){
          lista.add(Horta.fromJson(h.data));
        });
        setState(() {
          this.listaHortas = lista;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.listaHortas.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(IconsApp.user),
          title: Text(this.listaHortas.elementAt(index).nomeHorta, style: TextStyle(fontSize: 16),),
        );
      }
    );
  }
}
