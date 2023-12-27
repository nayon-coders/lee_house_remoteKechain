import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturentapp/appConfig.dart';
import 'package:resturentapp/model/couponsListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponsController{
  //coupons list
  static Future<CouponsListModel> getCoupons({required String locationId, required String restaurantId, required bool directOrder})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
      var res = await http.get(Uri.parse(AppConfig.COUPONS+"direct_order=$directOrder&restaurant=$restaurantId&location=$locationId"),
        headers: {
          "Authorization" : "token $token"
        }
      );
      return CouponsListModel.fromJson(jsonDecode(res.body));
  }
}