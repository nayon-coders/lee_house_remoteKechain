import 'package:flutter/material.dart';

class AppConfig{

  static const String DOMAIN = "https://test.api.chatchefs.com";
  static const String BASE_URL = "$DOMAIN/api";
  static const String TEST_BASE_URL = "https://test.api.chatchefs.com/api";
  static const String TEST_PAYMENT_SECRET_KEY = "pk_test_51NYylEF40kPax6brf5RFrQeto6o7aLVDZc6QrpAvUdQGTT6bwvHm91sVttWOEacEq32J7UzbuvQqMYvufRFlGFxK00a8BeWd1D";
  static const String TEST_SECRET_KEY = "sk_test_51NYylEF40kPax6brRcvDLyG2Hb3zzZv1JG0fsb1RIKULhaRzPVAdC8ypT3Ed6u3URaLqCD3UATECeXWROQ8WwkPN00BJgL5wrD";
  static const String TEST_PUBLISH_KEY = "pk_test_51NYylEF40kPax6brf5RFrQeto6o7aLVDZc6QrpAvUdQGTT6bwvHm91sVttWOEacEq32J7UzbuvQqMYvufRFlGFxK00a8BeWd1D";
  static const String LIVE_PAYMENT_SECRET_KEY = "pk_live_51NYylEF40kPax6brKpt2DQvC3ryCufIYWmpHa2h1vBFDGM8mU3aR36zClnGg3hDcBkRErqXsHJxlRwNLAvEL1myk00zpIEwGnM";


  static const String MENUD_LIST_BY_LOCATION = "$BASE_URL/food/v1/menu/?locations=2&direct_order=True";//HERE LOCATION ID END POINT
  static const String SIGNUP = "$BASE_URL/accounts/v1/user/register/";//HERE LOCATION ID END POINT
  static const String SIGNIN = "$BASE_URL/accounts/v1/login/email/";//HERE LOCATION ID END POINT
  static const String GOOGLE_LOGIN = "$BASE_URL/accounts/v1/login/google/";//HERE LOCATION ID END POINT
  static const String COUPONS = "$BASE_URL/marketing/v1/voucher/?";//HERE LOCATION ID END POINT
  static const String COUNTRY = "https://api.countrystatecity.in/v1/countries";//HERE LOCATION ID END POINT
  static const String CREATE_QOUTE = "$BASE_URL/billing/v1/doordash/create-quote/";//HERE LOCATION ID END POINT
  static const String STRIP_PAYMENT_METHOD = "$BASE_URL/billing/v1/stripe/";//HERE LOCATION ID END POINT
  static const String ORDER_LIST = "$BASE_URL/billing/v1/order/";//HERE LOCATION ID END POINT
  static const String RESTAURANT_DETAILS = "$BASE_URL/food/v1/location/item/?slug=3994-shelbourne-street-victoria-namer-v8n-3e2-1c72dd04";//HERE LOCATION ID END POINT
  //HERE LOCATION ID END POINT


}