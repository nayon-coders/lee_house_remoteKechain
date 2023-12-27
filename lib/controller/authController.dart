import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:resturentapp/appConfig.dart';
import 'package:resturentapp/view/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{

  /////////// register //////////////
  static Future<http.Response> signUp({
    required Map<String, dynamic> data, 
  })async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(AppConfig.SIGNUP),
      body: data,
    );
    if(response.statusCode == 201){
      _pref.setString("email", jsonDecode(response.body)["email"]);
      _pref.setString("phone", jsonDecode(response.body)["phone"]);
    }
    return response;
  }

  /////////// SIGNIN //////////////
  static Future<http.Response> singnIn({
    required Map<String, dynamic> data,
  })async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(AppConfig.SIGNIN),
      body: data,
    );
    print("login result === ${response.body}");
    print("login result === ${response.statusCode}");
    if(response.statusCode == 200){
      _pref.setString("token", jsonDecode(response.body)["token"]);
      _pref.setString("username", "${jsonDecode(response.body)["user_info"]["first_name"]} ${jsonDecode(response.body)["user_info"]["last_name"]}");
    }
    return response;
  }



  /////logout
  static logout()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove("token");
    _pref.remove("username");
    Get.offAll(Login());
  }
}