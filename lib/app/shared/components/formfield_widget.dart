import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function(String) onFieldSubmitted;
  final TextInputType keyboardType;
  final String initialValue;
  final String msgError;
  final Icon icon;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final bool searching;
  const FormFieldWidget(
      {Key key,
      this.labelText,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      this.keyboardType,
      this.initialValue,
      this.msgError,
      this.icon,
      this.textCapitalization,
      this.textInputAction,
      this.searching = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        initialValue: initialValue,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: keyboardType,
        maxLines: null,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            prefixIcon: icon,
            labelText: labelText,
            errorText: msgError,
            border: OutlineInputBorder(),
            suffixIcon: searching
                ? Container(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  )
                : IconButton(
                    icon: Icon(FontAwesome.cancel_circled),
                    onPressed: () {
                      controller.clear();
                      onChanged('');
                    })));
  }
}
