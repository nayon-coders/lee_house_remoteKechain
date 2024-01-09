import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturentapp/appConfig.dart';
import 'package:resturentapp/model/restaruant_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantController{

  //get restaurant details
  static Future<ResturentDetails> getRestaurantDetails()async{
    var res = await http.get(Uri.parse(AppConfig.RESTAURANT_DETAILS),
      headers: {
        "Accept" : "application/json"
      }
    );
    return ResturentDetails.fromJson(jsonDecode(res.body));
  }



}