import 'package:flutter/material.dart';
class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey[300])
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
      ),
      height: size.height * 0.20,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shrinkWrap: true,
        children: <Widget>[
          Text("Insira seu nome", style: TextStyle(fontSize: 20),),
          TextFormField(
            
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar")
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Salvar")
              )
            ],
          )
        ]
      ),
    );
  }
}