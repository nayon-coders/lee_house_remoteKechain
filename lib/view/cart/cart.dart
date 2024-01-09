import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/controller/orderController.dart';
import 'package:resturentapp/controller/restaruant_controller.dart';
import 'package:resturentapp/model/menuModel.dart';
import 'package:resturentapp/model/quote_model.dart';
import 'package:resturentapp/utility/appConst.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/address/address_add.dart';
import 'package:resturentapp/view/auth/login.dart';
import 'package:resturentapp/view/coupon/coupon_list.dart';
import 'package:resturentapp/view/orders/order_place_success.dart';
import 'package:resturentapp/view/payment/payment_list.dart';
import 'package:resturentapp/viewController/alertController.dart';
import 'package:resturentapp/viewController/appNetworkImage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../local_storage/cart/car_hive_controller.dart';
import '../../local_storage/cart/cartmodel.dart';
import '../../viewController/sidebysideText.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<HiveCartModel> dataList = [];

  final _couponCode = TextEditingController();
  final _additionlInfo = TextEditingController();

  List<Map<String, dynamic>> orderListItem = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList =  HiveCartController.cartBox.values.toList();
    _calculateTotal();
    _selectedCartItems();
    _getRestaurantDetails();
  }

  ///===== get restaurant details =====//
  var resName, resPhoneNUmber, resAddress, doordash_external_store_id;
  void _getRestaurantDetails()async{
    var res = await RestaurantController.getRestaurantDetails();
    setState(() {
      resName = res.restaurantName!;
      resPhoneNUmber = res.phone! ?? "+17784322111";
      resAddress = res.details!;
      doordash_external_store_id = res.doordashExternalStoreId!;
    });
  }

  //amount carculating variables
  double _subTotal = 0.00;
  double _totalAmount = 0.00;
  double _serviceFee = 0.0;
  double _estimatedTax = 0.0;
  double _deliveryFee = 0.00;
  double _discount = 0.00;

  //selected address
  QuoteCreateModel? _quoteCreateModel;
  var selectedPaymentMethod;


  ///========= calculate the total price ======///
  ///TODO:: we need some loading, until this function successfully run
  void _selectedCartItems()async{
    for(var i in dataList){
      setState(() {
        orderListItem.add(
            {
              "menu_item": i.id,
              "quantity": i.qty,
              "modifiers": [
              ]
            }
          );
      });
    }
  }

  ///========= calculate the total price ======///
  var token;
  void _calculateTotal() async{

    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState((){ token = _pref.getString("token");});
    double total = 0;
    if(dataList.isNotEmpty){
      for (var item in dataList) {
        total += (double.parse("${item!.price}") * int.parse("${item!.qty}"));
      }
      print("_totalAmount $total");
    }
    _subTotal = total;

    //total
    _totalAmount = (_subTotal + _serviceFee + _estimatedTax + _deliveryFee);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.dark,
          appBar: AppBar(
            leading: IconButton(
              onPressed: ()=>Get.back(),
              icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
            ),
            backgroundColor: AppColors.dark,
            title: const Text("Cart list",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: dataList.length == 0
                ?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/no_cart.png", height: 100, width: 100,),
                SizedBox(
                    width: 200,
                    child: Center(child: const Text("Your cart is empty. Please add some food into your cart.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ))),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()=>Navigator.pop(context, true),
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Center(child: Text("Go Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15
                          ),
                        ),),
                      ),
                    ),
                  ],
                )
              ],
            )
                :  ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Order Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text("${resName ?? ""}",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 20,),
                SizedBox(
                  //height: 80.00 * dataList.length,
                  child: ListView.builder(
                    shrinkWrap: true,
                   // physics: NeverScrollableScrollPhysics(),
                    itemCount: dataList.length,
                    itemBuilder: (_, index){
                     // qty = int.parse("${dataList[index].qty}");
                     //  qty = int.parse("${dataList[index].qty}");

                     // qty = 30;
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isDeletingIndex.contains(index)? Colors.red.shade200 : AppColors.dark,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1, blurRadius: 2,
                              offset: Offset(0,2)
                            )
                          ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Row(
                             children: [
                               SizedBox(
                                   width:60,
                                   height: 60,
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                     child: AppNetworkImage( src: dataList[index].image == "null"
                                         ? "https://img.freepik.com/premium-vector/cooking-process-pan_602006-4.jpg?w=740"
                                         :  dataList[index].image!,
                                       fit: BoxFit.cover,
                                     ),
                                     //child: AppNetworkImage(src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIahHPyA0zEQufe9eb6UEac2lIlwttjWCj_Mu4SQW9NZDjRzaqRSbrN32eWvv-vCqm7TA&usqp=CAU",)
                                   )
                               ),
                               SizedBox(width: 20),

                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width*.50,
                                     child: Text("${dataList[index].name}",
                                       style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.w400,
                                           letterSpacing: 1.5,
                                         color: Colors.black
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 5,),
                                   Text("CA\$ ${double.parse("${dataList[index].price}").toStringAsFixed(2)} X ${dataList[index].qty}",
                                     style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.w400,
                                         letterSpacing: 1.5,
                                         color: Colors.black
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*.22,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("CA\$ ${(double.parse("${dataList[index].price}") * double.parse("${dataList[index].qty}")).toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: ()=>decriment(index),
                                        child: Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Icon(Icons.remove, color: Colors.white, size: 20,),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                          padding: EdgeInsets.only(left: 5, right: 5),
                                          decoration: BoxDecoration(
                                            //color: AppColors.mainColor,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child:  Center(
                                            child: Text("${dataList[index].qty}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.black
                                              ),
                                            ),
                                          )
                                      ),

                                      InkWell(
                                        onTap:()=>incriment(index),
                                        child: Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Icon(Icons.add, color: Colors.white, size: 20,),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),


                //coupon ///
                Container(
                  margin: const EdgeInsets.only(left: 15.0, right:15, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                   boxShadow: [
                  BoxShadow(
                  color: Colors.grey.shade100,
                    blurRadius: 5,
                    spreadRadius: 1,
                  )]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _couponCode,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            hintText: "Coupon Code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()=> token != null ? goToCouponScreen() : NotLoginPoup(),
                        // here location
                        // id is static now.
                        child: Container(
                          width: 150,
                          height:55,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Center(
                            child: Text("Select Coupon",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.20),
                  child: TextFormField(
                    controller: _additionlInfo,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Additional instructions (if any)",
                    ),
                  ),
                ),


                //delivery and payment box
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: AppColors.mainColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery address",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: _quoteCreateModel != null ? Colors.green : Colors.grey.shade200)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               _quoteCreateModel == null
                                   ? Text("Select delivery address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black
                                  ),
                                )
                                   : Text("${_quoteCreateModel!.dropoffAddress!}",
                                 style: TextStyle(
                                     fontWeight: FontWeight.normal,
                                     fontSize: 14,
                                     color: Colors.black
                                 ),
                               ),
                                InkWell(
                                  onTap: ()=> token != null
                                      ? goToAddressScreen()
                                      : NotLoginPoup() ,
                                  child: _quoteCreateModel == null
                                      ?  Text
                                    ("Add New",
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 15,
                                    ),
                                  )
                                        : Text
                                    ("Edit",
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: 15,),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text("Payment Method",
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.normal,
                      //           fontSize: 18,
                      //           color: Colors.white
                      //       ),
                      //     ),
                      //     SizedBox(height: 10,),
                      //     Container(
                      //       width: double.infinity,
                      //       padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           border: Border.all(width: 1, color: Colors.grey.shade200)
                      //       ),
                      //       child:  Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text( selectedPaymentMethod ?? "12423*******65",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.normal,
                      //                 fontSize: 14,
                      //                 color: Colors.white
                      //             ),
                      //           ),
                      //           InkWell(
                      //             onTap: ()=>goToPaymentScreen(),
                      //             child: Text("Edit",
                      //               style: TextStyle(
                      //                   color: AppColors.mainColor,
                      //                   fontSize: 15
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SideBySideCartTextWidget(
                  left: "Sub Total",
                  right: "CA\$ ${_subTotal.toStringAsFixed(2)}",
                ),
                _discount != 0.00 ? SideBySideCartTextWidget(
                  left: "Discount",
                  right: "(-) CA\$ ${_discount.toStringAsFixed(2)}",
                ):Center(),
                SideBySideCartTextWidget(
                  left: "Service Fee",
                  right: "(+) CA\$ $_serviceFee",
                ),
                SideBySideCartTextWidget(
                  left: "Estimated Tax",
                  right: "(+) CA\$ ${_estimatedTax}",
                ),
                SideBySideCartTextWidget(
                  left: "Delivery Fees",
                  right: "(+) CA\$ ${_deliveryFee}",
                ),
                SideBySideCartTextWidget(
                  left: "Total",
                  right: "CA\$ ${_totalAmount.toStringAsFixed(2)}",
                ),
              ],
            ),
          ),
          bottomNavigationBar:  InkWell(
            onTap: ()=>_quoteCreateModel != null ? makePaymentMethod() : deliveryLocationRequired(),
            child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.mainColor
              ),
              child:  Center(
                child: isPlacingOrder ? CircularProgressIndicator(color: Colors.white,) : Text("Make Payment",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w200,
                      color: AppColors.white
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///====== not login =====///
  void NotLoginPoup(){
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        //contentPadding: EdgeInsets.only(left: 30, right: ),
        title: "",
        titleStyle: TextStyle(fontSize: 0),
        content: Column(
          children: [
            Image.asset(
              AppConst.noLogin,
              height: 100,
              width: 100,
            ),
            SizedBox(
                width: 200,
                child: Center(
                    child: const Text(
                      "You need to login first to placing order.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ))),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(), settings: RouteSettings(arguments: {"no registror"})) ),
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xffc54500),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  ///===== make payment ====///
  //make payment method
  bool isPlacingOrder = false;
  void makePaymentMethod() async{
    setState(() => isPlacingOrder = true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token"); //store the login token
    if(token != null){//check it have token or not/ if token have then user can place order
      var createStripIntentResponse = await OrderController.placeOrderWithStrip(quoteCreateModel: _quoteCreateModel!, resId: "101", locationId: "56");
      if(createStripIntentResponse.statusCode == 200){
        await OrderController.makePaymentWithStrip(context: context, currency: _quoteCreateModel!.currency!.toString(), price: _quoteCreateModel!.costs!.total!, resName: resName, secretKey: jsonDecode(createStripIntentResponse.body)["clientSecret"]);
        HiveCartController.cartBox.clear(); //when place order it done, the hive database will be clear;
      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 3000),
          content: Text("Something went wrong. Please try again."),));
        setState(() => isPlacingOrder = false);

      }

    }else{
      Get.defaultDialog(
          titlePadding: EdgeInsets.zero,
          //contentPadding: EdgeInsets.only(left: 30, right: ),
          title: "",
          titleStyle: TextStyle(fontSize: 0),
          content: Column(
            children: [
              Image.asset(
                AppConst.noLogin,
                height: 100,
                width: 100,
              ),
              SizedBox(
                  width: 200,
                  child: Center(
                      child: const Text(
                        "You need to login first to placing order.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ))),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(), settings: RouteSettings(arguments: {"no registror"})) ),
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffc54500),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ));
      setState(() => isPlacingOrder = false);
    }
    setState(() => isPlacingOrder = false);


  }


  ///=================== decriment ==============//
  List isDeletingIndex = [];
  void decriment(index) {
    if(int.parse("${dataList[index].qty}") > 1){
      HiveCartController.cartBox.putAt(index, HiveCartModel("${dataList[index].id.toString()}", "${dataList[index].name.toString()}", "${int.parse("${dataList[index].qty}")-1}", "${dataList[index].image}", "${dataList[index].price}", "${dataList[index].resid}", "${dataList[index].resName}" ) );
      dataList =  HiveCartController.cartBox.values.toList();
      _calculateTotal();
      setState(() {});
    }else {
      setState(() =>isDeletingIndex.add(index));
      Future.delayed(Duration(milliseconds: 500), () {
        // 5s over, navigate to a new page
        HiveCartController.cartBox.deleteAt(index);
        dataList =  HiveCartController.cartBox.values.toList();
        _calculateTotal();
        setState(() =>isDeletingIndex.remove(index));
      });

    }
  }

  ///=================== increment ==============//
  incriment(index) {
      HiveCartController.cartBox.putAt(index, HiveCartModel("${dataList[index].id.toString()}", "${dataList[index].name.toString()}", "${int.parse("${dataList[index].qty}")+1}", "${dataList[index].image}", "${dataList[index].price}","${dataList[index].resid}", "${dataList[index].resName}") );
      dataList =  HiveCartController.cartBox.values.toList();
      _calculateTotal();
      setState(() {});
    }

    //navigator to the coupon list screen
  goToCouponScreen() async{
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>CouponList(resId: dataList[0]!.resid!, locationId: AppConst.LOCATON_ID, totalAmount: _totalAmount)));
    if(result != null){
      setState(() {
        _couponCode.text = result["voucherCode"]; //assign the value that get from coupon pages
        _discount = double.parse("${result["amount"]}"); //assign the value that get from coupon pages
        //now calulating the cart price with discount
        _totalAmount = _totalAmount - 30.00;
      });
      AlertController.snackBar(text: "You get CA\$${result["amount"]} discount.", context: context, bg: Colors.green);
    }

  }

  //this method for navigate to the Address Screen
  goToAddressScreen() async{
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressAdd(pickup_address:resAddress, pickup_phone_number: resPhoneNUmber, pickup_external_store_id: doordash_external_store_id, order_items: orderListItem, resturentname: resName)));
    if(result != null){
      setState(() {
        _quoteCreateModel = result; //assign the value that get from coupon pages
        _deliveryFee = _quoteCreateModel!.costs!.deliveryFee!;
        _discount = _quoteCreateModel!.costs!.discount!;
        _estimatedTax = _quoteCreateModel!.costs!.tax!;
        _serviceFee = _quoteCreateModel!.fee!;
        _totalAmount = (_subTotal + _serviceFee + _estimatedTax + _deliveryFee);
      });
      print("_quoteCreateModel === ${_quoteCreateModel?.dropoffAddress!}");
    }
  }

  //this method for navigate to the payment Screen
  goToPaymentScreen() async{
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethodList()));
    if(result != null){
      setState(() {
        selectedPaymentMethod = hideAndRevealCharacters(result); //assign the value that get from coupon pages
      });
    }
  }
  //hide after first 4
  String hideAndRevealCharacters(String input) {
    if (input.length <= 4) {
      return input;
    }

    String hiddenPart = '*' * (input.length - 4);
    String revealedPart = input.substring(input.length - 4);

    return "${input.substring(0, 4)}$hiddenPart$revealedPart";
  }


  //////=============== if user not select address, then show a popup for adding address ==========//
  void deliveryLocationRequired() {
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
                      "Please select delivery address.",
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





}

