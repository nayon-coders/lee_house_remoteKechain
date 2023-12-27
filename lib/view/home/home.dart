import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturentapp/utility/appConst.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/auth/login.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/view/profile/afterLoginProfile.dart';
import 'package:resturentapp/viewController/appButton.dart';
import 'package:resturentapp/viewController/appNetworkImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? token;
  getLoginUserToken()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      token = _pref.getString("token");
    });
    print("token === ${token}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginUserToken();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.dark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                // width: size.width*.70,
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(AppConst.logo),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: size.width,
              height: 350,
              child: Image.asset(AppConst.appBanner, fit: BoxFit.cover,),
            ),
            SizedBox(height: 20,),
            ///TODO: its comment out for Hui-Lau shan mobile app, we upcomment when it usefull
            // ListTile(
            //   leading: Icon(Icons.home_filled,
            //     size: 50,
            //     color: AppColors.mainColor,
            //   ),
            //   title: Text("Address",
            //     style: TextStyle(
            //         fontSize: 22,
            //         fontWeight: FontWeight.w600
            //     ),
            //   ),
            //   subtitle: Text("123 Main Street, Cityville, State 12345, United States",
            //     style: TextStyle(
            //         fontSize: 17,
            //         fontWeight: FontWeight.w400
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10,),
            // const ListTile(
            //   leading: Icon(Icons.home_filled,
            //     size: 50,
            //     color: AppColors.mainColor,
            //   ),
            //   title: Text("Opening Hours",
            //     style: TextStyle(
            //         fontSize: 22,
            //         fontWeight: FontWeight.w600
            //     ),
            //   ),
            //   subtitle: Text("Monday-Friday 10:00 PM - 8:00 PM",
            //     style: TextStyle(
            //         fontSize: 17,
            //         fontWeight: FontWeight.w400
            //     ),
            //   ),
            // ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 3,
                        blurRadius: 7
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(width: size.width*.60,
                      child: Text("Members can enjoy permanet benefits",
                        style: TextStyle(
                            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600
                        ),
                      )
                  ),
                  token == null
                      ? AppButton(onClick: ()=>Get.to(Login()),  width: 80, height: 50, text: "Log-in", bg: AppColors.mainColor,)
                      :AppButton(onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 3,))), width: 80, height: 50, text: "Join Now", bg: AppColors.mainColor,)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 1, fromWhere: "delivery",),)),
                      child: Container(
                        // padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 3,
                                  blurRadius: 7
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Text("Delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Align(alignment: Alignment.centerRight, child: Image.asset(AppConst.deliveryIcon, fit: BoxFit.contain,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 1,  fromWhere: "pickup",))),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 3,
                                  blurRadius: 7
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Text("Pick-Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Align(alignment: Alignment.centerLeft, child: Image.asset(AppConst.pickupIcon, fit: BoxFit.contain,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 3,
                        blurRadius: 7
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: size.width*.30,
                      child: Text("Group Ordering",
                        style: TextStyle(
                            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600
                        ),
                      )
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment:Alignment.centerRight,
                        child: Text("Quick Package\nAutomatic split Payment",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,)
                    ],
                  )
                ],
              ),
            ),

            // Container(
            //   width: size.width,
            //   height: 100,
            //   margin: EdgeInsets.only(left: 20, right: 20),
            //   //padding: EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 5),
            //   decoration: BoxDecoration(
            //       color: AppColors.mainColor,
            //       borderRadius: BorderRadius.circular(20),
            //       border: Border.all(width: 1, color: AppColors.secColor),
            //       boxShadow: [
            //         // BoxShadow(
            //         //     color: Colors.grey.shade300,
            //         //     spreadRadius: 3,
            //         //     blurRadius: 4,
            //         //     offset: Offset(0, 2)
            //         // )
            //       ]
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             width: MediaQuery.of(context).size.width*.60,
            //             height: 98,
            //             padding: EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 5),
            //             decoration: BoxDecoration(
            //                 color: AppColors.secColor,
            //                 borderRadius: BorderRadius.only(
            //                   topRight: Radius.circular(100),
            //                   topLeft: Radius.circular(20),
            //                   bottomLeft: Radius.circular(20),
            //                 )
            //             ),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text("Join Our Franchise Now",
            //                   style: TextStyle(
            //                       fontSize: 20,color: Colors.white,
            //                       fontWeight: FontWeight.w400
            //                   ),
            //                 ),
            //                 SizedBox(height: 10,),
            //                 Text("Love Mango Desserts",
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.w400
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           SizedBox(width: 10,),
            //           Container(
            //             width: 100,
            //             height: 35,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(100)
            //             ),
            //             child: Center(child: Text("Join Now",
            //               style: TextStyle(
            //                 color: AppColors.secColor,
            //               ),
            //             )),
            //           )
            //         ],
            //       ),
            //
            //
            //
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20,),
            // ProfileVouchersBox(size: size, text: "Get 20% OFF", subtext: "KIU7688", image: "assets/images/hui_vcoucher.png",),
            // SizedBox(height: 20,),
            // ProfileVouchersBox(size: size, text: "Get 20% OFF", subtext: "KIU7688", image: "assets/images/group_order.png",),
            // SizedBox(height: 20,),
            // ProfileVouchersBox(size: size, text: "On Selected item", subtext: "Buy 1 get 1", image: "assets/images/hui_bigo.png",),


            ///TODO: we comment it for Hui Lau theme
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Menus",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: HomeFoosList.homeFoodList.length,
                      itemBuilder: (_, index){
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.mainColor.withOpacity(0.2),
                                    offset: Offset(0,1),
                                    blurRadius: 4,
                                    spreadRadius: 1
                                )
                              ]
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: AppNetworkImage(src: "${HomeFoosList.homeFoodList[index].image}", height: 100, width: 100,),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${HomeFoosList.homeFoodList[index].name}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      color: AppColors.white
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("${HomeFoosList.homeFoodList[index].price}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.50,
                                    child: Text("${HomeFoosList.homeFoodList[index].description}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.white
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.50,
                                    child: Row(
                                      children: [

                                        Icon(Icons.chat_bubble_outline, size: 15,
                                            color: AppColors.white),
                                        SizedBox(width: 3,),
                                        Text("${HomeFoosList.homeFoodList[index].review}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.white
                                          ),
                                        ),
                                        SizedBox(width: 3,),
                                        Text("Reviews",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}


class HomeFoosList{
  static  List<HomeFoodListModel> homeFoodList = [
    HomeFoodListModel(
        name: "Burger",
        price: "CA \$23.90",
        description: "Lorem ipsum dolor sit amet consectetu",
        image: "https://images.unsplash.com/photo-1572448862527-d3c904757de6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8&w=1000&q=80",
        review: "90"
    ),
    HomeFoodListModel(
        name: "Pizza",
        price: "CA \$33.90",
        description: "Lorem ipsum dolor sit amet consectetur ",
        image: "https://storage.needpix.com/rsynced_images/food-3245765_1280.jpg",
        review: "130"
    ),
    HomeFoodListModel(
        name: "Biriyani",
        price: "CA \$33.90",
        description: "One of the reasons I like to cook mostly healthy ...",
        image: "https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg",
        review: "130"
    ),
    HomeFoodListModel(
        name: "Chicken Fri\y",
        price: "CA \$43.90",
        description: "One of the reasons I like to cook mostly healthy food is so I ",
        image: "https://spoonsofflavor.com/wp-content/uploads/2020/08/Easy-Chicken-Fry-Recipe.jpg",
        review: "80"
    ),
  ];
}

class HomeFoodListModel{
  final String name;
  final String price;
  final String description;
  final String review;
  final String image;
  HomeFoodListModel({required this.name, required this.price, required this.description, required this.image, required this.review});
}
