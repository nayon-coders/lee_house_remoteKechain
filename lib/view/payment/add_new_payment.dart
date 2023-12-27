import 'package:credit_card_form/credit_card_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/viewController/alertController.dart';
import 'package:resturentapp/viewController/appBackButton.dart';
import 'package:resturentapp/viewController/appNetworkImage.dart';

class AddNewPaymentMethod extends StatefulWidget {
  const AddNewPaymentMethod({Key? key}) : super(key: key);

  @override
  State<AddNewPaymentMethod> createState() => _AddNewPaymentMethodState();
}

class _AddNewPaymentMethodState extends State<AddNewPaymentMethod> {

  final _holderName = TextEditingController();
  final _cardNumber = TextEditingController();
  final _cardCvv = TextEditingController();

  List _paymentMethodList = [
    "https://w7.pngwing.com/pngs/314/877/png-transparent-visa-logo-credit-card-debit-card-mastercard-logo-visa-go-blue-text-trademark.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png",
    "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/249_Paypal_Credit_Card_logo-512.png"
  ];
  List _SelectedPeymentMethod = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Add new payment method",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250,
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _paymentMethodList.length,
                      itemBuilder: (_,index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              _SelectedPeymentMethod.clear();
                              _SelectedPeymentMethod.add(index);
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1, color: AppColors.mainColor)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: AppNetworkImage(src: "${_paymentMethodList[index]}", height: 70, width: 70, fit: BoxFit.contain,)),
                              ),
                             _SelectedPeymentMethod.contains(index) ? Icon(Icons.check_circle, color: Colors.green,)  :Center(),
                            ],
                          ),
                        );
                      },
                    )
                  ),
                ),
                SizedBox(height: 40,),

                CreditCardForm(
                  theme: CreditCardLightTheme(),
                  onChanged: (CreditCardResult result) {
                    setState(() {
                      _cardNumber.text =addSpaceEvery4Characters(result.cardNumber);
                      print("length == ${_cardNumber.text.length}");
                    });
                    print(result.cardNumber);
                    print(result.cardHolderName);
                    print(result.expirationMonth);
                    print(result.expirationYear);
                    print(result.cardType);
                    print(result.cvc);
                  },
                ),

                SizedBox(height: 50,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      if(_SelectedPeymentMethod.isNotEmpty){
                        Navigator.pop(context, _cardNumber.text);
                      }else{
                        AlertController.snackBar(text: "Select payment type & add card information.", context: context, bg: Colors.red);
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(child: Text("Add card",
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
          bottomNavigationBar: AppBackButton(size: MediaQuery.of(context).size, onClick: ()=>Navigator.pop(context)),

        ),
      ),
    );
  }

  String addSpaceEvery4Characters(String input) {
     var test = input.replaceAllMapped(
      RegExp(r".{4}"), (match) => "${match.group(0)}  ",
    );
     print("test ==$test");
     return test;
  }
}
