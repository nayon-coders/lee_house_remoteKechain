import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturentapp/appConfig.dart';
import 'package:resturentapp/model/location_model/city_model.dart';
import 'package:resturentapp/model/location_model/country_model.dart';
import 'package:resturentapp/model/location_model/state_model.dart';

class LocationController{

  //country
  static Future<http.Response> getCountryListController()async{
    var res = await http.get(Uri.parse("https://api.countrystatecity.in/v1/countries"),
      headers: {
        "X-CSCAPI-KEY":
        "VU5OcmcwcGdwdnNJM1dNYzlVTEhxTFl1SER5c0NDZmRrSjJSWlhyTw==",
      },
    );
    print("res == ${res.statusCode}");
    print("res == ${res.body}");
    return res;
  }

  //state
  static Future getStateListController({required String countryIso2})async{
    var res = await http.get(Uri.parse("https://api.countrystatecity.in/v1/countries/$countryIso2/states?="),
      headers: {
        "X-CSCAPI-KEY":
        "VU5OcmcwcGdwdnNJM1dNYzlVTEhxTFl1SER5c0NDZmRrSjJSWlhyTw==",
      },
    );
    return res;
  }


  //city
  static Future getCityListController({required String countryIso2, required String stateIso2})async{
    var res = await http.get(Uri.parse("https://api.countrystatecity.in/v1/countries/$countryIso2/states/$stateIso2/cities"),
      headers: {
        "X-CSCAPI-KEY":
        "VU5OcmcwcGdwdnNJM1dNYzlVTEhxTFl1SER5c0NDZmRrSjJSWlhyTw==",
      },
    );
    return res;
  }

}