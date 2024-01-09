import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resturentapp/appJson.dart';
import 'package:resturentapp/controller/menuController.dart';
import 'package:resturentapp/local_storage/cart/car_hive_controller.dart';
import 'package:resturentapp/model/menuModel.dart';
import 'package:resturentapp/utility/appConst.dart';
import 'package:resturentapp/view/cart/cart.dart';
import 'package:resturentapp/viewController/notFound.dart';
import 'package:scrollable_list_tabview/model/list_tab.dart';
import 'package:scrollable_list_tabview/model/scrollable_list_tab.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

import '../../appConfig.dart';
import '../../local_storage/cart/cartmodel.dart';
import '../../utility/colors.dart';
import '../../viewController/appNetworkImage.dart';

class Menu extends StatefulWidget {
  final String? fromWhere;

  const Menu({Key? key, this.fromWhere}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //////////// initially set res info string ////////////
  var resId, resName, resturentAddress, resturentPhoneNumber;

  //////////// initially set res info string ////////////

  bool isDelivery = true;
  bool isPickup = true;
  List<ScrollableListTab> tabs = [];
  List<String> menus = ["Main Menu", "Drinks", "Lunch"];
  List<Color> selectedMenuColors = [AppColors.mainColor];

  List<MenuitemSet> menuItemsList = [];
  List<MenuitemSet> categoryMenuItemList = [];
  List _seletedFav = [];

  ///assign
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getSingleResturent("2");
    getCartItemFromHive();
    getFoodMenuFuture = getData();

    //set pic and delivery option
    if (widget.fromWhere != null) {
      if (widget.fromWhere == "delivery") {
        isDelivery = true;
        isPickup = false;
      } else {
        isDelivery = false;
        isPickup = true;
      }
    }
  }

  Future<MenuModel>? getFoodMenuFuture;

  Future<MenuModel> getData() async {
    setState(()=> isLoading = true);
    var res = await MenuControllers.getSingleResturent("${AppConst.LOCATON_ID}");
    _seletedMainMenu.clear();
    menuSetItemsId.clear();

    ///===== store restaurant information =====//
    resturentAddress = res.results![0]!.locationNames;
    resId = res.results![0]!.restaurant.toString();
    resName = res.results![0]!.restaurantName.toString();
    resturentPhoneNumber = "+17784322111";
    print("resturentAddress assign === ${resturentAddress}");
    print("resName assign === ${resName}");
    ///===== store restaurant information =====//

    ///////////// i just added hole category list into this list child list ////////
    for (var i = 0; i < res!.results![0]!.categorySet!.length; i++) {
      setState(() {
        categorySet.add(res!.results![0]!.categorySet![i]);
        _seletedMenuId.add(categorySet[0].name.toString());
      });

      print("categorySet ===== ${categorySet.length}");
    }
    ///////////// i just added hole category list into this list child list ////////


    ///////////// Add menu set  ////////
    /// For loop to store menu item set
    for(var i = 0; i < res.results![0]!.menuitemSet!.length; i++){
      setState(() {
        menuItemsList.add(res.results![0]!.menuitemSet![i]);
      });
      print("menuItemsList ===== ${menuItemsList.length}");
    }

    //set menuSetItemsId
    for (var i = 0; i < categorySet[0].menuitemSet!.length; i++) {
      setState(() {
        menuSetItemsId.add(categorySet[0].menuitemSet![i].toString());
      });
    }


    //sem categoryMenuItemList
    for (var menuSetItems = 0; menuSetItems < menuItemsList.length; menuSetItems++) {
      if (menuSetItemsId.contains("${menuItemsList[menuSetItems].id}")) {
        setState(() {
          categoryMenuItemList.add(menuItemsList[menuSetItems]);
        });
      }
    }

    //============================ store resid and resname =========================//

    _seletedMainMenu.add(res!.results![0]!.id.toString());

    // if (res!.results![0]!.categorySet!.isNotEmpty) {
    //   menuSetItemsId.add(res!.results![0]!.categorySet![0].menuitemSet![0].toString());
    // }
    setState(()=> isLoading = false);
    return res;
  }

  /////////// selected menu ids/////////////
  List _seletedMenuId = [];

  /////////// selected menu ids/////////////

  /////////// selected menu ids/////////////
  List _seletedMainMenu = [];

  /////////// selected menu ids/////////////

  List<CategorySet> categorySet = [];
  List<String> menuSetItemsId = [];

  /////
  List isHaveHiveCart = [];

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));
    var locale = Localizations.localeOf(context);
    // Initialize the message lookup

    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: AppColors.dark,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          toolbarHeight: 100.0,
          leadingWidth: 150,
          leading: Image.asset(AppConst.logo),
          backgroundColor: AppColors.dark,
          elevation: 0,
          actions: [
            Container(
              width: size.width * .32,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              decoration: BoxDecoration(
                color: const Color(0xffA1C298),
                borderRadius: BorderRadius.circular(100),
              ),
              child: isDelivery
                  ? DeliveryButtonMenu(
                      size: size,
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 30,
                        top: 5,
                        bottom: 5,
                      ),
                      text: "Delivery",
                      image: AppConst.deliveryIconBlack,
                      color: Color(0xffB5F1CC),
                      onClick: () {
                        setState(() {
                          isDelivery = false;
                          isPickup = true;
                        });
                      },
                    )
                  : DeliveryButtonMenu(
                      size: size,
                      text: "Pick-Up",
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 5,
                        top: 5,
                        bottom: 5,
                      ),
                      image: AppConst.deliveryIconBlack,
                      color: const Color(0xffFA7070),
                      onClick: () {
                        setState(() {
                          isDelivery = true;
                          isPickup = false;
                        });
                      },
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (){
                if(isLoading){
                  return null;
                }else{
                  if(dataList.length != 0){
                    navigateAndDisplaySelection(context);
                  }else{
                    ifDontHaveAnyFoodOnCart();
                  }

                }
              },
              child: Container(
                width: size.width * .20,
                margin: EdgeInsets.only(top: 30, bottom: 30),
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: isLoading ?  AppColors.mainColor.withOpacity(0.3) :
                      AppColors.mainColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Cart",
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            AppConst.cartIcon,
                            height: 20,
                            color: AppColors.white,
                          )
                        ],
                      ),
                    ),
                    dataList.length != 0
                        ? Positioned(
                            right: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Center(
                                child: Text(
                                  "${dataList.length}",
                                  style: const TextStyle(
                                      color: AppColors.mainColor),
                                ),
                              ),
                            ),
                          )
                        : Center()
                  ],
                ),
              ),
            )
          ],
          // bottom: PreferredSize(
          //   preferredSize:const Size.fromHeight(60.00) ,
          //   child: SizedBox(
          //     height: 50,
          //     child: ListView.builder(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: menus.length,
          //       itemBuilder: (_, index){
          //         return TopBarMenuButton(
          //           onClick: (){
          //             setState(() {
          //               selectedMenuColors.clear();
          //               selectedMenuColors.add(AppColors.menuColors[index]);
          //               assignData();
          //               print("selectedMenuColors[0] === > ${selectedMenuColors[0]}");
          //             });
          //           },
          //           color: AppColors.menuColors[index],
          //           text: "${menus[index]}",
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ),
        body: FutureBuilder<MenuModel>(
          future: getFoodMenuFuture,
          builder: (_, snapshot) {
            print(" snapshot.data! == ${snapshot.data}");
            print(" snapshot.data! == ${snapshot.error}");
            print(" snapshot.data! == ${snapshot.hashCode}");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 5,
                              blurRadius: 5)
                        ]),
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    )),
              );
            } else if (snapshot.hasData) {
              //menuSetItemsId.add(snapshot.data!.results![0]!.categorySet![0].menuitemSet![0]);

              print("_seletedMainMenu === ${_seletedMainMenu}");

              //======== top menu =========//
              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: snapshot.data!.results!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, mainMenuIndex) {
                        return InkWell(
                          onTap: () {
                            print(
                                "isHaveHiveCart top menu ===${isHaveHiveCart}");

                            /////when click main menu clear the first categoryMenuItemList name//////
                            _seletedMainMenu.clear();

                            /////when click main menu clear the first categorySet name//////
                            categorySet.clear();

                            /////when click main menu clear the first _seletedMenuId name//////
                            _seletedMenuId.clear();

                            /////when click main menu clear the first menuSetItemsId name//////
                            menuSetItemsId.clear();

                            //when click main menu clear the menuItemsList
                            menuItemsList.clear();

                            /////when click main menu clear the first categoryMenuItemList name//////
                            categoryMenuItemList.clear();
                            _seletedMainMenu.add(snapshot.data!.results![mainMenuIndex]!.id.toString());
                            setState(() {
                              ///////////// i just added hole category list into this list child list ////////
                              for (var i = 0; i < snapshot.data!.results![mainMenuIndex]!.categorySet!.length; i++) {
                                categorySet.add(snapshot.data!.results![mainMenuIndex]!.categorySet![i]);
                                /////when click main menu add the first categoryMenuItemList name//////
                                // categoryMenuItemList.add(menuItemsList[0]);
                                /////when click main menu add the first catetgory name//////

                                print("menuItemsList by click cat === ${menuItemsList.length}");
                                _seletedMenuId.add(categorySet[0].name.toString());
                              }

                              for(var i = 0; i < snapshot.data!.results![mainMenuIndex]!.menuitemSet!.length; i++){
                                menuItemsList.add(snapshot.data!.results![mainMenuIndex]!.menuitemSet![i]);
                              }

                              //============================ store resid and resname =========================//
                              // _seletedMenuId.add(categorySet[0].name.toString());
                              ///////////// i just added hole category list into this list child list ////////
                              Future.delayed(Duration(milliseconds: 100), () {
                                //// category set i get
                                ////// i get menuSetId set from category set
                                for (var i = 0; i < categorySet[0].menuitemSet!.length; i++) {
                                  setState(() {
                                    menuSetItemsId.add(categorySet[0].menuitemSet![i].toString());
                                  });
                                }

                                //// ============== add menu item list in to sidecategory item list ========//
                                for (var menuSetItems = 0; menuSetItems < menuItemsList.length; menuSetItems++) {
                                  if (menuSetItemsId.contains("${menuItemsList[menuSetItems].id}")) {
                                    setState(() {
                                      categoryMenuItemList.add(menuItemsList[menuSetItems]);
                                    });
                                    // print("hive === topcategoru ${categoryMenuItemList[4].id}");
                                    //
                                    // print("hive === topcategoru ${isHaveHiveCart}");
                                    // print("hive === topcategoru ${isHaveHiveCart.contains(categoryMenuItemList[1].id.toString())}");
                                    setState(() {});
                                  }
                                }
                              });

                              for (var i = 0;
                                  i < categoryMenuItemList.length;
                                  i++) {
                                print(
                                    "categoryMenuItemList ==== ${categoryMenuItemList[i].id}");
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: _seletedMainMenu.contains(snapshot
                                        .data!.results![mainMenuIndex]!.id
                                        .toString())
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                "${snapshot.data!.results![mainMenuIndex]!.title}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    //       child: ScrollableListTabView(
                    //       tabHeight: 60,
                    //       bodyAnimationDuration: const Duration(milliseconds: 150),
                    //       tabAnimationCurve: Curves.easeOut,
                    //       tabAnimationDuration: const Duration(milliseconds: 200),
                    //       tabs: tabs
                    //
                    // ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  /////////////////////////// side menu category and Items ///////////////////
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: ListView.builder(
                                itemCount: categorySet.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  var itemsData = categorySet![index]!;
                                  menuSetItemsId.add(categorySet[0]
                                      .menuitemSet![0]
                                      .toString());
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _seletedMenuId.clear();
                                        categoryMenuItemList.clear();
                                        menuSetItemsId.clear();
                                        _seletedMenuId.add(categorySet[index].name.toString());
                                        print("menuSetItemsId ==== ${categorySet[index]!.restaurantName}");

                                        //// category set i get
                                        ////// i get menuSetId set from category set
                                        for (var i = 0; i < categorySet[index].menuitemSet!.length; i++) {
                                          //print("menuset_list == =${categorySet[index].menuitemSet![i].toString()}");
                                            setState(() {
                                              menuSetItemsId.add(categorySet[index].menuitemSet![i].toString());
                                            });
                                          print("menuset_list added == =${menuSetItemsId.length}");
                                          }

                                        for (var menuSetItems = 0; menuSetItems < menuItemsList.length; menuSetItems++) {
                                          if (menuSetItemsId.contains("${menuItemsList[menuSetItems].id}")) {
                                            setState(() {
                                              categoryMenuItemList.add(menuItemsList[menuSetItems]);
                                            });
                                          }
                                        }
                                      });

                                      print("isHaveHiveCart --- ======= ${categorySet[index]!.name.toString()}");
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                        ),
                                        color: _seletedMenuId.contains(
                                                categorySet[index]
                                                    .name
                                                    .toString())
                                            ? AppColors.mainColor
                                            : AppColors.menuColor,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${categorySet[index]!.name.toString()}",
                                          locale: Locale('zh'),
                                          style: TextStyle(
                                            //fontFamily: "NotoSansCJKSC",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                            color: _seletedMenuId.contains(
                                                    categorySet[index]
                                                        .name
                                                        .toString())
                                                ? AppColors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        //child:  MyLocalizedWidget("${categorySet[index]!.name.toString()}"),
                                      ),
                                    ),
                                  );
                                })),
                        Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${_seletedMenuId.isEmpty ? " " : "${_seletedMenuId[0]}"}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        letterSpacing: 1.3),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: categoryMenuItemList.isEmpty
                                      ? NotFound(
                                          text: "Food Not Found",
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          //physics: NeverScrollableScrollPhysics(),
                                          itemCount:
                                              categoryMenuItemList.length,
                                          itemBuilder: (_, menuSetIndex) {
                                            var categoryMenuItemsData =
                                                categoryMenuItemList[
                                                    menuSetIndex];

                                            print("categoryMenuItemsData!.name === ${categoryMenuItemsData!.name}");

                                            //print("categoryMenuItemsData!.originalImage! === ${categoryMenuItemsData!.images![0]!.workingUrl}");

                                            return SizedBox(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  bottom: 10,
                                                  left: 10,
                                                ),
                                                padding: EdgeInsets.only(
                                                    left: 10, top: 5, bottom: 5),
                                                decoration: BoxDecoration(
                                                    color: AppColors.menuColor,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade200,
                                                          spreadRadius: 2,
                                                          blurRadius: 4,
                                                          offset: Offset(0, 2))
                                                    ]),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            width: 60,
                                                            height: 60,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  AppNetworkImage(
                                                                src: categoryMenuItemsData!
                                                                        .images!
                                                                        .isEmpty
                                                                    ? "https://img.freepik.com/premium-vector/cooking-process-pan_602006-4.jpg?w=740"
                                                                    : categoryMenuItemsData!
                                                                        .images![
                                                                            0]!
                                                                        .workingUrl!,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              //child: AppNetworkImage(src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIahHPyA0zEQufe9eb6UEac2lIlwttjWCj_Mu4SQW9NZDjRzaqRSbrN32eWvv-vCqm7TA&usqp=CAU",)
                                                            )),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        SizedBox(
                                                          width: size.width * .33,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${categoryMenuItemsData!.name}",
                                                                locale: Locale('zh'),

                                                                style: TextStyle(
                                                                  fontFamily: "NotoSansCJKSC",
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                "CA \$ ${categoryMenuItemsData!.basePrice}",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    letterSpacing:
                                                                        1.2),
                                                              ),
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // SizedBox(
                                                                  //   width: size.width*.50,
                                                                  //   child: Text("Try correcting the name to the name of an existing getter, or defining a getter or field named",
                                                                  //     style: TextStyle(
                                                                  //       fontSize: 10,
                                                                  //       fontWeight: FontWeight.w200,
                                                                  //     ),
                                                                  //   ),
                                                                  // ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      // Container(
                                                                      //   padding:const EdgeInsets.all(3),
                                                                      //   decoration: BoxDecoration(
                                                                      //     color: Colors.brown,
                                                                      //     borderRadius: BorderRadius.circular(3),
                                                                      //   ),
                                                                      //   child: const Text("N",
                                                                      //     style: TextStyle(
                                                                      //         color: Colors.white,
                                                                      //         fontWeight: FontWeight.w400,
                                                                      //         fontSize: 10
                                                                      //     ),
                                                                      //   ),
                                                                      // ),
                                                                      // SizedBox(width: 5,),
                                                                      Icon(
                                                                        color: Colors
                                                                            .black,
                                                                        Icons
                                                                            .mode_comment_outlined,
                                                                        size: 15,
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      const Text(
                                                                        "96 Reviews",
                                                                        style:
                                                                            TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (_seletedFav
                                                                  .contains(
                                                                      categoryMenuItemsData
                                                                          .id)) {
                                                                _seletedFav.remove(
                                                                    categoryMenuItemsData
                                                                        .id);
                                                              } else {
                                                                _seletedFav.add(
                                                                    categoryMenuItemsData
                                                                        .id);
                                                              }
                                                              setState(() {});
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 50,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 5),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: _seletedFav
                                                                            .contains(categoryMenuItemsData.id)
                                                                        ? Colors.blueGrey
                                                                        : Color(0xffeeeeee),
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              100),
                                                                      topRight: Radius
                                                                          .circular(
                                                                              100),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              20),
                                                                    ),
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          1)
                                                                ]),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  width: 30,
                                                                  height: 30,
                                                                  decoration: BoxDecoration(
                                                                      color: _seletedFav.contains(categoryMenuItemsData
                                                                              .id)
                                                                          ? AppColors
                                                                              .mainColor
                                                                          : Colors
                                                                              .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100)),
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2,
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    "43",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        InkWell(
                                                          onTap: () => addToCart(
                                                              categoryMenuItemsData:
                                                                  categoryMenuItemsData,
                                                              resId: resId,
                                                              resName: resName),
                                                          child: Container(
                                                            width: 50,
                                                            height: 30,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: isHaveHiveCart
                                                                            .contains(categoryMenuItemsData
                                                                                .id
                                                                                .toString())
                                                                        ? Colors
                                                                            .green
                                                                        : AppColors
                                                                            .mainColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              100),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              100),
                                                                    ),
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          5,
                                                                      offset:
                                                                          Offset(
                                                                              3,
                                                                              5))
                                                                ]),
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Icon(
                                                                  isHaveHiveCart.contains(
                                                                          categoryMenuItemsData
                                                                              .id
                                                                              .toString())
                                                                      ? Icons
                                                                          .delete_forever
                                                                      : Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 15,
                                                                )),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Text("Pease check you internet"),
              );
            }
          },
        ),
      ),
    );
  }

  ///////////////////////// add to cart /////////////////
  ///////////////////////// this is add to local server /////////////////
  addToCart(
      {required MenuitemSet categoryMenuItemsData,
      required String resId,
      required String resName}) async {
    print("yes conning");
    //========== call the list method ============//
    getCartItemFromHive();

    if (dataList.isNotEmpty && dataList[0].resid != resId) {
      //===== if you have different restaurant cart product then show a pop up======//
      showAllerForRemovingAllItemFromCart(categoryMenuItemsData);
    } else {
      //========= if you alleray have same product into your cart then it go else ///////
      if (isHaveHiveCart.contains("${categoryMenuItemsData.id.toString()}")) {
        ////////// store hive id /////App
        var cartFoodId = HiveCartController.cartBox.values
            .firstWhere((p) => p.id == categoryMenuItemsData.id.toString());

        ///// check if food id is not null, then remode it from hive store////
        if (cartFoodId != null) {
          // Delete the person
          await cartFoodId.delete();
          print('Person deleted: ${cartFoodId.id}');
        } else {
          print('Person not found: $cartFoodId');
        }

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Product remove from cart"),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
        ));
        setState(() {
          /////  if  isHaveHiveCart container categoryMenuItemsData.id.toString(), then remove it from isHaveHiveCart////
          isHaveHiveCart.remove("${categoryMenuItemsData.id.toString()}");
          getCartItemFromHive();
          print("isHaveHiveCart ======= ${isHaveHiveCart}");
        });
      } else {
        HiveCartController.cartBox.add(HiveCartModel(
            "${categoryMenuItemsData.id.toString()}",
            "${categoryMenuItemsData.name.toString()}",
            "1",
            "${categoryMenuItemsData.originalImage?.workingUrl}",
            "${categoryMenuItemsData.basePrice}",
            "$resId",
            "$resName"));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Product added into cart"),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
        ));
        setState(() {
          isHaveHiveCart.add("${categoryMenuItemsData.id.toString()}");
          getCartItemFromHive();
        });
      } //===== if you dont have different restaurant cart product ======//
    }
  }

///////////////////////// this is add to local server /////////////////

  //////// gobal list for hive cart item//////
  List<HiveCartModel> dataList = [];

  void getCartItemFromHive() async {
    isHaveHiveCart.clear();
    dataList = HiveCartController.cartBox.values.toList();
    //getCartItemFromHive();
    for (var i = 0; i < dataList.length; i++) {
      setState(() {
        isHaveHiveCart.add("${dataList[i].id.toString()}");
      });
    }

    print("isHaveHiveCart inis ===${isHaveHiveCart}");
  }

//======== when user want to add same resturent food add on to there cart ==========//
  void showAllerForRemovingAllItemFromCart(categoryMenuItemsData) {
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        //contentPadding: EdgeInsets.only(left: 30, right: ),
        title: "",
        titleStyle: TextStyle(fontSize: 0),
        content: Column(
          children: [
            Image.asset(
              "assets/images/remove_cart.png",
              height: 100,
              width: 100,
            ),
            SizedBox(
                width: 200,
                child: Center(
                    child: const Text(
                  "You can not add multiple restaurant food.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ))),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "NO",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    HiveCartController.cartBox.clear();
                    addToCart(
                        categoryMenuItemsData: categoryMenuItemsData,
                        resId: resId,
                        resName: resName);
                    Get.back();
                    setState(() {});
                  },
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffc54500),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Remove & Add",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

//////=============== if dont have any food on thire cart ==========//
  void ifDontHaveAnyFoodOnCart() {
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        //contentPadding: EdgeInsets.only(left: 30, right: ),
        title: "",
        titleStyle: TextStyle(fontSize: 0),
        content: Column(
          children: [
            Image.asset(
              "assets/images/no_cart.png",
              height: 100,
              width: 100,
            ),
            SizedBox(
                width: 200,
                child: Center(
                    child: const Text(
                  "Your cart is empty. Please add some food into your cart.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ))),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  // nvigator the cart page
  Future<void> navigateAndDisplaySelection(BuildContext context) async {
    print("resName === ${resName}");
    print("resName === ${resturentPhoneNumber}");
    print("resName === ${resturentAddress}");
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) =>  Cart()),
    );

    // if result is true then call hive cart database
    if (result) {
      getCartItemFromHive();
      setState(() {});
    }
    print("result == ${result}");
  }
}

class MenuSinlgeItems extends StatelessWidget {
  const MenuSinlgeItems({
    super.key,
    required this.size,
    required this.text,
    required this.isSelectedColor,
  });

  final Color isSelectedColor;
  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
      decoration: BoxDecoration(
          color: isSelectedColor, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ),
    );
  }
}

class TopBarMenuButton extends StatelessWidget {
  const TopBarMenuButton({
    super.key,
    required this.text,
    required this.color,
    required this.onClick,
  });

  final String text;
  final Color color;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
        margin: EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        child: Text(
          "$text",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}

class DeliveryButtonMenu extends StatelessWidget {
  const DeliveryButtonMenu({
    super.key,
    required this.size,
    required this.onClick,
    required this.text,
    required this.image,
    required this.color,
    required this.margin,
  });

  final Size size;
  final VoidCallback onClick;
  final String text;
  final String image;
  final Color color;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: size.width * .20,
        margin: margin,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$text",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(image)
          ],
        ),
      ),
    );
  }
}

class MyLocalizedWidget extends StatelessWidget {
  final String text;
  MyLocalizedWidget(this.text);
  @override
  Widget build(BuildContext context) {
    // Retrieve the current locale
    var locale = Localizations.localeOf(context);

    // Initialize the message lookup
    var messages = MyLocalizations(locale, text);

    return Text(messages.greeting());
  }
}

class MyLocalizations {
  final Locale locale;
  final String text;

  MyLocalizations(this.locale, this.text);

  // The `Intl.message` function automatically initializes messages for the specified locale.
  String greeting() => Intl.message('${text}', name: 'greeting', desc: 'Greeting', locale: locale.languageCode);
// Add more methods as needed
}