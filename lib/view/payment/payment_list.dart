import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/payment/add_new_payment.dart';
import 'package:resturentapp/viewController/appBackButton.dart';


class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({Key? key}) : super(key: key);

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {

  //payment methods
  List _existingPaymentMethod = [
    "4234  4535  2342  2342  ",
    "2345  2342  5356  2452  ",
    "6868  6868  6565  3535  "
  ];

  //selected payment methods
  List _selectedPaymentMethod = [ "1455 **** ***** ***32",]; ///initial 1
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Payment Method",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Select payment method",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _existingPaymentMethod.length,
                  itemBuilder: (_,index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedPaymentMethod.clear();
                          _selectedPaymentMethod.add(_existingPaymentMethod[index]);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _selectedPaymentMethod.contains(_existingPaymentMethod[index]) ? AppColors.mainColor.withOpacity(0.1) : Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.payment, color: AppColors.mainColor, size: 25,),
                                SizedBox(width: 10,),
                                Text("${hideAndRevealCharacters(_existingPaymentMethod[index])}",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),

                            _selectedPaymentMethod.contains(_existingPaymentMethod[index]) ? Icon(Icons.check) : Center(),
                          ],
                        ),

                      ),
                    );
                  },
                ),

                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: ()=>goToAddNewPaymentMethod(),
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(child: Text("Add new payment",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: AppBackButton(size: MediaQuery.of(context).size, onClick: ()=>Navigator.pop(context, _selectedPaymentMethod[0])),
        ),
      ),
    );
  }



  //this method for navigate to the Address Screen
  goToAddNewPaymentMethod() async{
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewPaymentMethod()));
    if(result != null){
      setState(() {
        _existingPaymentMethod.add(result); //assign the value that get from coupon pages
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
}
