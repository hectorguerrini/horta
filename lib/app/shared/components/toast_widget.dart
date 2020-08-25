import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  final String msg;

  const ToastWidget({Key key, @required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
          padding: EdgeInsets.all(16), color: Colors.green, child: Text(msg)),
    );
  }
}
