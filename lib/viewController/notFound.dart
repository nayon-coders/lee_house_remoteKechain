import 'package:flutter/material.dart';


class NotFound extends StatelessWidget {
  const NotFound({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/notfound.jpeg", height: 100, width: 100,)),

        SizedBox(height: 10,),
        Align(
            alignment: Alignment.center,
            child:Text("${text}",
              style: TextStyle(
                color: Colors.white
              ),
            )
        )
      ],
    );
  }
}