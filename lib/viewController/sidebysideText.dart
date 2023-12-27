import 'package:flutter/material.dart';

class SideBySideCartTextWidget extends StatelessWidget {
  const SideBySideCartTextWidget({
    super.key, required this.left, required this.right,
  });

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$left",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black
            ),
          ),
          Text("$right",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}
