import 'package:flutter/material.dart';

import '../utility/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final bool isLoading;
  final Color? bg;
  final Color? textColor;
  const AppButton({
    super.key, this.textColor = Colors.white, required this.onClick, required this.text, this.width = 150, this.fontSize =16, this.height = 50, this.isLoading = false, this.bg = AppColors.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isLoading? bg ?.withOpacity(0.5) :bg
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(strokeWidth: 1, color: Colors.white,)
              : Text("$text",
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor
            ),
          ),
        ),
      ),
    );
  }
}
