import 'package:flutter/material.dart';


class AlertController{

  //////////snackbar//////////////
  static snackBar({required String text, required BuildContext context, required Color bg}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 4000),
      backgroundColor: bg,
    ));
  }


}