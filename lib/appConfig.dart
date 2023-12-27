import 'package:flutter/material.dart';

class AppConfig{

  static const String DOMAIN = "https://api.chatchefs.com";
  static const String BASE_URL = "$DOMAIN/api";


  static const String MENUD_LIST_BY_LOCATION = "$BASE_URL/food/v1/menu/?locations=2&direct_order=True";//HERE LOCATION ID END POINT
  static const String SIGNUP = "$BASE_URL/accounts/v1/user/register/";//HERE LOCATION ID END POINT
  static const String SIGNIN = "$BASE_URL/accounts/v1/login/email/";//HERE LOCATION ID END POINT
  static const String GOOGLE_LOGIN = "$BASE_URL/accounts/v1/login/google/";//HERE LOCATION ID END POINT
  static const String COUPONS = "$BASE_URL/marketing/v1/voucher/?";//HERE LOCATION ID END POINT
  static const String COUNTRY = "https://api.countrystatecity.in/v1/countries";//HERE LOCATION ID END POINT


}