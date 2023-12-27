import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/utility/appConst.dart';
import 'package:resturentapp/view/auth/login.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utility/colors.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginUser();
  }
  getLoginUser()async{
    Future.delayed(Duration(milliseconds: 1000), () async{
      SharedPreferences _pref = await SharedPreferences.getInstance();
      var token = _pref.getString("token");
      if(token!=null){
        Get.offAll(AppBottomNavigationBar());
      }else{
        Get.offAll(AppBottomNavigationBar());
      }
      });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(AppConst.logo),
      ),
    );
  }
}
