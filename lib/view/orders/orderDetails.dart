import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/model/order_list_model.dart';
import 'package:resturentapp/utility/colors.dart';

import '../../viewController/appBackButton.dart';

class OrderDetails extends StatelessWidget {
  final OrderListResult orderResult;
  const OrderDetails({Key? key, required this.orderResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(color: AppColors.dark,
      child: SafeArea(child: Scaffold(backgroundColor: AppColors.dark,
        body: SingleChildScrollView(padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text("${orderResult!.status == "pending" ? "Preparing "
                    "Your Food" : orderResult!.status == "cancel" ? "Order "
                    "Canceled" : "On the way" }",
                  style:
                TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.black),),),
              SizedBox(height: 10,),
              Center(child: Text("Estimated Time 7-10 Mins", style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black),),),
              SizedBox(height: 40,),
              Text("Order No. #${orderResult.id}", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.black),),
              SizedBox(height: 10,),
              Text("Order Details", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black),),
              SizedBox(height: 10,),
              Text("Restaurant Name", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black),),
              SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orderResult!.orderitemSet!.length,
                itemBuilder: (_, index){
                  return  ListTile(title: Text("${orderResult!
                      .orderitemSet![index]!.quantity} x ${orderResult!
                      .orderitemSet![index]!.itemName}", style:
                  TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),),
                    trailing: Text("${orderResult!.currency} ${orderResult!
                        .orderitemSet![index]!.order}", style:
                    TextStyle
                      (fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),),
                    subtitle: orderResult!
                        .orderitemSet![index]!.modifiers!.isEmpty
                        ?Center() : Text(
                      "**Item Add-ons**", style: TextStyle(color: Colors
                        .black),),);
              },
              ),
              SizedBox(height: 30,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal", style: TextStyle(fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18,),),
                  Text("${orderResult!.currency} ${orderResult!.subtotal}", style:
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18),)
                ],),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15),),
                  Text("${orderResult!.currency} ${orderResult!.deliveryFee}", style:
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15),)
                ],),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edtimeated Tax", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 17),),
                  Text("${orderResult!.currency} ${orderResult!.tax}", style:
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 17),)
                ],),

              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18),),
                  Text("${orderResult!.currency} ${orderResult!.total}", style:
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18),)
                ],),
              SizedBox(height: 40,),

            ],),),
        bottomNavigationBar: AppBackButton(
          size: size, onClick: () => Get.back(),),),),);
  }
}
