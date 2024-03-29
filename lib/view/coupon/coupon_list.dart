import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/controller/couponsController.dart';
import 'package:resturentapp/local_storage/cart/car_hive_controller.dart';
import 'package:resturentapp/local_storage/cart/cartmodel.dart';
import 'package:resturentapp/model/couponsListModel.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/view/cart/cart.dart';
import 'package:resturentapp/viewController/alertController.dart';
import 'package:resturentapp/viewController/notFound.dart';

class CouponList extends StatefulWidget {
  final bool isComeFromCart;
  final String resId;
  final String locationId;
  final dynamic totalAmount;
  const CouponList({Key? key, required this.resId, required this.locationId, this.totalAmount, this.isComeFromCart = true}) : super(key: key);

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  //bool for terms
  bool isTerms = false;
  List isHaveHiveCart = [];

  var totalAmount;

  List<HiveCartModel> dataList = [];
  void getCartItemFromHive() async {
    isHaveHiveCart.clear();
    dataList = HiveCartController.cartBox.values.toList();
    //getCartItemFromHive();
    for (var i = 0; i < dataList.length; i++) {
      setState(() {

        totalAmount = double.parse("${dataList[i].price}");

      });
    }
    print("isHaveHiveCart inis ===${isHaveHiveCart}");
    print("isHaveHiveCart inis ===${totalAmount}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartItemFromHive();
    getCouponsList();////this is coupons method
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Coupons",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 30,
              color: Colors.black
            ),
          ),
          leading: IconButton(
            onPressed: ()=>Get.back(),
            icon: Icon(Icons.arrow_back, color: Colors.black,),
          ),
        ),
        body: isLoading?  Center(
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
        ): Container(
          padding: EdgeInsets.all(30),
          child: couponsList!.isNotEmpty
              ? ListView.builder(
              itemCount: couponsList!.length,
              itemBuilder: (_, index){
                return Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: AppColors.mainColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${couponsList![index]!.name}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("You have ${couponsList![index]!.name} OFF.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Text("${couponsList![index]!.voucherCode}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    color: Colors.white
                                  ),
                                ),
                              ),


                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  print("couponsList![index].amount == ${couponsList![index].amount}");
                                  if(totalAmount != null) {
                                    if (totalAmount > couponsList![index].amount) {
                                      if(widget.isComeFromCart){
                                        Navigator.pop(context, {
                                          "voucherCode": "${couponsList![index]!
                                              .voucherCode}",
                                          "amount": "${couponsList![index]!
                                              .amount}",
                                        });
                                      }else{
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart(couponAmount: couponsList![index]!.amount, couponCode: couponsList![index]!.voucherCode,)));
                                      }

                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                        content: Text("You need minimum  CA\$${couponsList![index]
                                            .amount} to Redeem this coupon."),
                                        backgroundColor: Colors.red,
                                        action: SnackBarAction(
                                          label: 'Go to menu',
                                          textColor: Colors.white,
                                          onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 1,))),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                      ));

                                    }
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      content: Text("Your Cart is empty. Go to menu and add to cart."),
                                      backgroundColor: Colors.red,
                                      action: SnackBarAction(
                                        label: 'Go to menu',
                                        textColor: Colors.white,
                                        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 1,))),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                    ));
                                  }
                                 },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: totalAmount != null && totalAmount > couponsList![index].amount ? AppColors.secColor : AppColors.secColor.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Text("Redeem Now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("Terms",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        isTerms = !isTerms;
                                      });
                                    },
                                    icon: Icon(isTerms? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_outlined),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      isTerms? Text(" Minimum Spend ${couponsList![index]!.minimumSpend} & Maximum spend ${couponsList![index]!.maxRedeemValue}.",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ):Center()
                    ],
                  ),
                );
              },

          ) : const NotFound(text: "They doesn't have any coupons right now.")
        ),
      ),
    );
  }

  // list of coupons result
  List<Result>? couponsList;
  bool isLoading = false;
  Future<CouponsListModel>? getCouponsList() async{
    setState(() =>isLoading = true);
    var res = await CouponsController.getCoupons(locationId: widget.locationId, restaurantId: widget.resId, directOrder: true);
    couponsList = res.results;
    setState(() =>isLoading = false);

    print("couponList === $couponsList");
    return res;
  }
}
