import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/utility/appConst.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/view/orders/orderDetails.dart';

import '../../viewController/appBackButton.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Container(
      color: AppColors.dark,
      child: SafeArea( 
        child: Scaffold(
          backgroundColor: AppColors.dark,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Orders",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      letterSpacing: 1.3,
                      color: Colors.black
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 200, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(  borderRadius: BorderRadius.circular(20), child: Image.asset(AppConst.appBanner, fit: BoxFit.cover,)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Completed",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 10,),

                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                            itemBuilder: (_, index){
                              return buildOrderItems(
                                size: size,
                                onClick: ()=>Get.to(OrderDetails()),
                              );
                            }
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: AppBackButton(size: size, onClick: ()=>Get.to(AppBottomNavigationBar()),),
        ),
      ),
    );
  }

  InkWell buildOrderItems({required Size size, required VoidCallback onClick}) {
    return InkWell(
                      onTap: onClick,
                      child: Container(
                        width: size.width,
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: AppColors.mainColor)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Name/number",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                      color: Colors.black
                                  ),
                                ),
                                Icon(Icons.double_arrow, color: Colors.white)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Order Date - Price - Number of items",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Order Issues",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(width: 1, color: AppColors.mainColor)
                                  ),
                                  child: Center(
                                    child: Text("Record",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(width: 1, color: AppColors.mainColor),
                                    borderRadius: BorderRadius.circular(30),

                                  ),
                                  child: Center(
                                    child: Text("View Receipt",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    );
  }
}
