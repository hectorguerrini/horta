import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String texto;

  Titulo(this.texto);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        //textAlign: TextAlign.center,
      ),
    );
  }
}
