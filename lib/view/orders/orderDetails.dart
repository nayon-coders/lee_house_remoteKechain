import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/utility/colors.dart';

import '../../viewController/appBackButton.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.dark,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.dark,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Center(
                  child: Text("Preparing Your Food",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text("Estimated Time 7-10 Mins",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Text("Order No. #032423",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 10,),
                Text("Order Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 10,),
                Text("Restaurant Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 20,),
                ListTile(
                  title: Text("2x Item Name 1",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  trailing: Text("CA\$16.97",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  subtitle: Text("**Item Add-ons**",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
                ListTile(
                  title: Text("1x Item Name 2",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  trailing: Text("CA\$16.97",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  subtitle: Text("**Item Add-ons**",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
                ListTile(
                  title: Text("2x Item Name 3",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  trailing: Text("CA\$16.97",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text("CA\$ 50.99",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Service Fee",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15
                      ),
                    ),
                    Text("CA\$ 1.99",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Edtimeated Tax",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                    Text("CA\$ 0.25.99",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 17
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Fee ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                    Text("CA\$ 0.50.99",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 17
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),
                    Text("CA\$ 53.99",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40,),

              ],
            ),
          ),
          bottomNavigationBar: AppBackButton(size: size, onClick: ()=>Get.back(),),
        ),
      ),
    );
  }
}
