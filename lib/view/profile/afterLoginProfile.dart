import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:resturentapp/controller/authController.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/view/coupon/coupon_list.dart';
import 'package:resturentapp/view/orders/orders.dart';
import 'package:resturentapp/view/profile/profileInfo.dart';
import 'package:resturentapp/viewController/home_rewardBox.dart';
import 'package:resturentapp/viewController/rewardBox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AfterLoginProfile extends StatefulWidget {
  const AfterLoginProfile({Key? key}) : super(key: key);

  @override
  State<AfterLoginProfile> createState() => _AfterLoginProfileState();
}

class _AfterLoginProfileState extends State<AfterLoginProfile> {
  int _counter = 0;

  double _lowerValue = 50;
  double _upperValue = 180;

  String? name;
  getLoginUserInfo()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      name = _pref.getString("username");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.dark,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.mainColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade500,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(1,1)
                                      )
                                    ]
                                  ),
                                  child: InkWell(
                                    onTap: ()=>Get.to(PersonalInfo()),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(100)
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.asset("assets/images/user_profile.png"))),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$name",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                        children:[
                                          InkWell(
                                            onTap:()=>AuthController.logout(),
                                            child: Container(
                                              width: 100,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              child: Center(child: Text("Logout")),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Container(
                                            width: 130,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                            child: Center(child: Text("Join Community")),
                                          )

                                        ]
                                    )
                                  ],
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        left: 20,
                        child: HomeRewardBox()
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                 child: Row(
                   children: [
                     ProfileBoxs(
                       text: "My Coupons",
                       icon: Icons.wallet,
                       onCick: ()=>Get.to(CouponList(resId: "2", locationId: "2"), transition: Transition.rightToLeft),
                     ),
                     SizedBox(width: 15,),
                     ProfileBoxs(
                       text: "My Order",
                       icon: Icons.shopping_cart,
                       onCick: ()=>Get.to(OrdersList(), transition: Transition.rightToLeft),
                     ),
                   ],
                 ),
               ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      ProfileBoxs(
                        text: "Account Info",
                        icon: Icons.settings,
                        onCick: ()=>Get.to(PersonalInfo(), transition: Transition.rightToLeft),
                      ),
                      SizedBox(width: 15,),
                      ProfileBoxs(
                        text: "Support",
                        icon: Icons.support_agent,
                        onCick: (){}
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                ProfileVouchersBox(size: size, text: "Get 30% OFF", subtext: "Use Code HG8776H", image: "assets/images/hui_vcoucher.png",),
                SizedBox(height: 20,),
                ProfileVouchersBox(size: size, text: "Group Order Fun", subtext: "Get up to 20% off", image: "assets/images/group_order.png",),
                SizedBox(height: 20,),
                ProfileVouchersBox(size: size, text: "On Selected items", subtext: "Buy 1 Get 1", image: "assets/images/hui_bigo.png",),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileVouchersBox extends StatelessWidget {
  const ProfileVouchersBox({
    super.key,
    required this.size, required this.text, required this.subtext, required this.image,
  });

  final Size size;
  final String text;
  final String subtext;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: AppColors.white),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2)
            )
          ]
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width*.40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$text",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(" $subtext",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 1,))),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text("Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        Image.asset(image,
          width: 130, height: 130,
        )

        ],
      ),
    );
  }
}

class ProfileBoxs extends StatelessWidget {
  const ProfileBoxs({
    super.key, required this.text, required this.icon, required this.onCick,
  });

  final String text;
  final IconData icon;
  final VoidCallback onCick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onCick,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: AppColors.mainColor),

          ),
          child:  Column(
            children: [
              Icon(icon, color: AppColors.mainColor, size: 50,),
              SizedBox(height: 7,),
              Text("$text",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
