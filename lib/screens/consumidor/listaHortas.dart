import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:horta/models/horta.dart';

import 'package:horta/services/consumidor.dart'; // IconsApp.(name_icon)
class ListaHortasScreenPage extends StatefulWidget {
  @override
  _ListaHortasScreenState createState() => _ListaHortasScreenState();
}

class _ListaHortasScreenState extends State<ListaHortasScreenPage> {
  List<HortaDocument> listaHortas = [];
  @override
  void initState() {
    super.initState();
    this.getHortas();
  }

  void getHortas() {    
    ConsumidorService().getHortas()
      .then((hortas){               
        setState(() {
          this.listaHortas = hortas.documents.map((h) => HortaDocument.fromJson({ 'uid': h.documentID, 'horta': h.data })).toList();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: this.listaHortas.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          // leading: Icon(IconsApp.user),
          title: Text(this.listaHortas.elementAt(index).horta.nomeHorta, style: TextStyle(fontSize: 18),),
          subtitle: Text(this.listaHortas.elementAt(index).horta.minhaHistoria,overflow: TextOverflow.ellipsis,),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            Navigator.pushNamed(context, '/detalhe', arguments: this.listaHortas.elementAt(index));
          },
        );
      }
    );
  }
}
