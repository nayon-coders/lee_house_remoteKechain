import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturentapp/utility/appConst.dart';

import '../appConfig.dart';
import '../model/menuModel.dart';

class MenuControllers{


  //get menu item by location
  static Future<MenuModel> getSingleResturent(id)async{
    print("data ==== $id");
    var response = await http.get(Uri.parse("${AppConfig.BASE_URL}/food/v1/menu/?locations=${AppConst.LOCATON_ID}&direct_order=True"),
      headers: {
        "Content-Type" : 'application/json; charset=utf-8'
      }
    );
    print("data ==== ${response.statusCode}");
    final decodedBody = utf8.decode(response.bodyBytes);

    print("data ==== ${jsonDecode(decodedBody)["results"][0]["menuitem_set"][0]["category_names"]}");
    if(response.statusCode == 200){
      return MenuModel.fromJson(jsonDecode(decodedBody));
    }else{
      return MenuModel.fromJson(jsonDecode(decodedBody));
    }
  }



}