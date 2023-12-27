import 'package:flutter/material.dart';
import 'package:resturentapp/utility/colors.dart';

class OrderTraking extends StatefulWidget {
  const OrderTraking({Key? key}) : super(key: key);

  @override
  State<OrderTraking> createState() => _OrderTrakingState();
}

class _OrderTrakingState extends State<OrderTraking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("O")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
