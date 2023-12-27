import 'package:flutter/material.dart';

import '../utility/colors.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback onClick;
  const AppBackButton({
    super.key,
    required this.size, required this.onClick,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(bottom: 30, top: 10, left: size.width*.20, right: size.width*.20),
        padding: EdgeInsets.only(left: 30, right: 30),
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.mainColor
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.keyboard_double_arrow_left_rounded, color: AppColors.white,),
            SizedBox(width: 20,),
            Text("Go Back",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
