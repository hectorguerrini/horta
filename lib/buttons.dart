import 'package:flutter/material.dart';

class AppButtons{
  AppButtons();
  static FlatButton flatButtonIconSave(func){
    return FlatButton.icon(
      onPressed: func,
      icon: Icon(Icons.save),
      label: Text('Salvar'),
      color: Colors.white,
      textColor: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.green))
    );
  }

}