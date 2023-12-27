import 'package:flutter/material.dart';


class AlertController{

  //////////snackbar//////////////
  static snackBar({required String text, required BuildContext context, required Color bg}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 3000),
      backgroundColor: bg,
    ));
  }


}