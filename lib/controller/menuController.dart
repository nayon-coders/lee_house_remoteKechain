import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturentapp/utility/appConst.dart';

import '../appConfig.dart';
import '../model/menuModel.dart';

class MenuControllers{


  //get menu item by location
  static Future<MenuModel> getSingleResturent(id)async{
    print("data ==== $id");
    var response = await http.get(Uri.parse("https://test.api.chatchefs.com/api/food/v1/menu/?locations=${AppConst.LOCATON_ID}&direct_order=True"));
    print("data ==== ${response.statusCode}");
    print("data ==== ${response.body}");
    if(response.statusCode == 200){
      return MenuModel.fromJson(jsonDecode(response.body));
    }else{
      return MenuModel.fromJson(jsonDecode(response.body));
    }
  }



}