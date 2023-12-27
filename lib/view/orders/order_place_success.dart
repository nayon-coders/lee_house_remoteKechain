import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/view/orders/orders.dart';
import 'package:resturentapp/viewController/appButton.dart';

class OrderPlaceSuccess extends StatefulWidget {
  const OrderPlaceSuccess({Key? key}) : super(key: key);

  @override
  State<OrderPlaceSuccess> createState() => _OrderPlaceSuccessState();
}

class _OrderPlaceSuccessState extends State<OrderPlaceSuccess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, size: 130, color: Colors.green,),
                SizedBox(height: 10,),
                Center(
                  child: Text("You order place successfully."),
                ),
                SizedBox(height: 30,),
                AppButton(onClick: ()=>Get.to(OrdersList()), text: "Go to order")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
