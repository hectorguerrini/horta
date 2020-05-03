import 'package:flutter/cupertino.dart';

class AppService {
  BuildContext context;

  AppService({this.context});

  Future showLoading() async {
    await showCupertinoDialog(

      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CupertinoActivityIndicator(radius: 30, animating: true,)
        ); 
      }
    );
  }
  
  Future closeLoading() async {
    Navigator.pop(context);    
  }
}