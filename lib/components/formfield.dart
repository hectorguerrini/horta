import 'package:flutter/material.dart';

class FormFieldsCustom{
  FormFieldsCustom();
  static AnimatedDefaultTextStyle animatedForm(String descricao, bool b, double labelSizeMin,double labelSizeMax,) {
    return AnimatedDefaultTextStyle(
        style: b
            ? TextStyle(fontSize: labelSizeMin, color: Colors.black87)
            : TextStyle(fontSize: labelSizeMax, color: Colors.black87),
        child: Text(descricao),
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn);
  }
}