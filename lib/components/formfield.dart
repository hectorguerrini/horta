import 'package:flutter/material.dart';

class FormFieldCustom extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType keyboardType;
  const FormFieldCustom(
      {Key key,
      this.labelText,
      this.controller,
      this.onChanged,
      this.keyboardType})
      : super(key: key);

  @override
  _FormFieldCustomState createState() =>
      _FormFieldCustomState(labelText, controller, onChanged, keyboardType);
}

class _FormFieldCustomState extends State<FormFieldCustom> {
  final String labelText;
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType keyboardType;
  _FormFieldCustomState(
      this.labelText, this.controller, this.onChanged, this.keyboardType);

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          enabled: edit,
          maxLines: null,
          decoration: InputDecoration(
            labelText: labelText,
            border: edit ? OutlineInputBorder() : InputBorder.none,
          )),
      trailing: IconButton(
          icon: Icon(edit ? Icons.check_circle_outline : Icons.edit),
          onPressed: () {
            setState(() {
              edit = !edit;
            });
          }),
    );
  }
}
