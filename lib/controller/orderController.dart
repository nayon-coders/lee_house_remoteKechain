import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:resturentapp/appConfig.dart';
import 'package:resturentapp/model/order_list_model.dart';
import 'package:resturentapp/model/quote_model.dart';
import 'package:resturentapp/view/orders/orders.dart';
import 'package:resturentapp/viewController/appButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrderController{

  //create quite
  static Future<http.Response> createQuote({
  required String dropoff_address,
  required String dropoff_phone_number,
  required String pickup_address,
  required String pickup_phone_number,
  required String pickup_business_name,
  required String first_name,
  required String last_name,
  required String pickup_external_store_id,
  required List<Map<String, dynamic>> order_items,
})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");

    print("order_items === ${order_items}");
    print("order_items === ${transformData(order_items)}");


    var data = {
      "dropoff_address": dropoff_address.toString(),
      "dropoff_phone_number": dropoff_phone_number,
      "pickup_address": pickup_address,
      "pickup_phone_number": "+17784322111",
      "pickup_business_name": pickup_business_name,
      "first_name": first_name,
      "last_name": last_name,
      "order_list": order_items,
      "orderitem_set": order_items,
      "pickup_external_store_id": pickup_external_store_id,
      "location":"49"
    };

    print("data ==== ${jsonEncode(data)}");
    print("data ==== ${AppConfig.CREATE_QOUTE}");

    var res = await http.post(Uri.parse(AppConfig.CREATE_QOUTE),
      headers: {
        "Content-Type": "application/json",
        "Authorization" : "token $token"
      },
      body: jsonEncode(data)
    );
    return res;
  }




  //create quite
  static Future<http.Response> placeOrderWithStrip({
    required QuoteCreateModel quoteCreateModel,
    required String resId,
    required String locationId
})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");

    List<Map<String, dynamic>> orderItems = [];
    for(var i in quoteCreateModel!.costs!.orderList!){
      orderItems!.add({
          "menu_item": i!.menuItem.toString(),
          "quantity": i!.quantity!.toString(),
          "modifiers": [
          ]

      });
    }

    var data = {
      "order_list": orderItems,
      "orderitem_set": orderItems,
      "currency": "${quoteCreateModel!.currency!}",
      "delivery_fee": quoteCreateModel!.costs!.deliveryFee!.toString(),
      "tips": quoteCreateModel!.tip.toString(),
      "delivery_platform": "doordash",
      "pickup_address": quoteCreateModel!.pickupAddress!.toString(),
      "pickup_business_name" : quoteCreateModel!.pickupBusinessName!.toString(),
      "pickup_phone_number": "+17784322111",
      "dropoff_address": quoteCreateModel!.dropoffAddress!.toString(),
      "dropoff_phone_number": quoteCreateModel!.dropoffPhoneNumber.toString() ,
      "dropoff_contact_first_name": quoteCreateModel!.dropoffContactGivenName.toString(),
      "dropoff_contact_last_name": quoteCreateModel!.dropoffContactFamilyName.toString(),
      "pickup_external_store_id": quoteCreateModel!.pickupExternalStoreId.toString(),
      "restaurant": resId,
      "location": locationId
    };

    var res = await http.post(Uri.parse(AppConfig.STRIP_PAYMENT_METHOD),
        headers: {
          "Content-Type": "application/json",
          "Authorization" : "token $token"
        },
        body: jsonEncode(data)
    );
    print("status === ${res.statusCode}");
    print("status === ${res.body}");
    return res;
  }


  //strip payment key
  static Map<String, dynamic>? paymentIntent;
  static Future<void> makePaymentWithStrip({required BuildContext context, required double price, required String currency, required String resName, required secretKey}) async {
    try {
      late final String amount;
      if (price.toString().contains(".")) {
        final priceInCents = (price * 100).round();
        amount = '$priceInCents';
      } else {
        amount = '${price.toInt()}00';
      }
       //paymentIntent = await createPaymentIntent(amount, currency, context);

      print("paymentIntent?['client_secret'] === ${secretKey}");
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          //paymentIntentClientSecret: await paymentIntent?['client_secret'],
          paymentIntentClientSecret: secretKey,
          style: ThemeMode.dark,
          merchantDisplayName: resName,
        ),
      );

      ///now finally display payment sheet
      displayPaymentSheet(context);
    } on StripeException catch (e) {
      print("error === ${e.error}");
      print("error === ${e.copyWith}");
    }
  }

  //display payment sheet intent
  static void displayPaymentSheet(context) async {
    try {
      print("display");
      await Stripe.instance.presentPaymentSheet();

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) =>  AlertDialog(
          content:Container(
            height: 400,
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, size: 130, color: Colors.green,),
                      SizedBox(height: 10,),
                      Center(
                        child: Text("You order place successfully."),
                      ),
                      SizedBox(height: 30,),
                      AppButton(onClick: ()=>Navigator.pushAndRemoveUntil
                        (context, MaterialPageRoute(builder: (context)
                      =>OrdersList()), (route) => false), text: 'Go to Orders',)
                    ],
                  ),
                ),
              ),
            ),
          )
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Paid successfully")));
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled "),
        ),
      );
    }
  }


  //create intent for strip payment
  static Future createPaymentIntent(String amount, String currency, BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      print("key ==== ${AppConfig.LIVE_PAYMENT_SECRET_KEY}");

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          // 'Authorization': 'Bearer sk_test_e4A0AUYMuEQGtSVyD45YW4a100MP17QXoC',
          'Authorization': 'Bearer sk_test_51NYylEF40kPax6brRcvDLyG2Hb3zzZv1JG0fsb1RIKULhaRzPVAdC8ypT3Ed6u3URaLqCD3UATECeXWROQ8WwkPN00BJgL5wrD',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      if (response.statusCode == 200) {
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${jsonDecode(response.body)["error"]["message"]}"),
          backgroundColor: Colors.red,
          duration: const Duration(milliseconds: 2300),
        ));
      }
      print("strip inten response == ${response.statusCode}");
      print("strip inten response == ${response.body}");
      // ignore: avoid_print

      return jsonDecode(response.body);
    } catch (err) {
      print(err.toString());
    }
  }


  //order list
  static Future<OrderListModel> orderList()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");

    print("token == ${token}");

    var res = await http.get(Uri.parse(AppConfig.ORDER_LIST),
        headers: {
          "Authorization" : "token $token",
          "Content-Type" : 'application/json; charset=utf-8'
        },
    );
    final decodedBody = utf8.decode(res.bodyBytes);
    print("res === ${res.statusCode}");
    print("res === ${res.body}");
    return OrderListModel.fromJson(jsonDecode(decodedBody));
  }


  static List<Map<String, dynamic>> transformData(List<Map<String, dynamic>> inputData) {
    Map<int, Map<String, dynamic>> resultMap = {};

    inputData.forEach((item) {
      int menuItemId = int.parse("${item["menu_item"]}");
      int quantity = int.parse("${item["quantity"]}");

      if (resultMap.containsKey(menuItemId)) {
        resultMap[menuItemId]!["quantity"] += quantity;
      } else {
        resultMap[menuItemId] = {"menu_item": menuItemId, "quantity": quantity, "modifiers": []};
      }
    });

    return resultMap.values.toList();
  }


}