import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class FormFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final String initialValue;
  final String msgError;
  const FormFieldWidget(
      {Key key,
      this.labelText,
      this.controller,
      this.onChanged,
      this.keyboardType,
      this.initialValue,
      this.msgError})
      : super(key: key);

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        maxLines: null,
        decoration: InputDecoration(
            labelText: widget.labelText,
            errorText: widget.msgError,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
                icon: Icon(FontAwesome.cancel_circled),
                onPressed: () {
                  widget.controller.clear();
                  widget.onChanged('');
                })));
  }
}
