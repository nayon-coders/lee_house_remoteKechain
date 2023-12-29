import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resturentapp/utility/appConst.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/home/home.dart';
import 'package:resturentapp/view/menu/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login.dart';
import '../gift/gift.dart';
import '../profile/afterLoginProfile.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? pageIndex;
  final String? fromWhere;
  const AppBottomNavigationBar({Key? key, this.pageIndex = 0, this.fromWhere}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  int _currentPage = 0;

  List<Widget> _pages = [
    Home(),
   // Menu(),
    ///this index 1 is come from initial state
    Gift(),
    AfterLoginProfile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserToken();
    _currentPage = widget.pageIndex!;

    _pages.insert(1,  Menu(fromWhere: widget.fromWhere,));//inset into list
  }
  var token;
  getUserToken()async{
   SharedPreferences _pref = await SharedPreferences.getInstance();
   setState(() {
     token = _pref.getString("token");
   });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.dark,

            body: _pages[_currentPage],
          bottomNavigationBar: Container(
            height: 80,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 7
                  )
                ]

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 35,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _currentPage = 0;
                      });
                    },
                    child: FaIcon(FontAwesomeIcons.houseChimney, size: 40, color:_currentPage == 0 ? AppColors.bottomNavigationSelectColor : AppColors.bottomNavigationUnselectColor,),
                  ),
                ),
                SizedBox(
                  width: 35,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _currentPage = 1;
                      });
                    },
                    child: FaIcon(FontAwesomeIcons.bowlRice, size: 40, color:_currentPage == 1 ? AppColors.bottomNavigationSelectColor : AppColors.bottomNavigationUnselectColor,),
                  ),
                ),
                SizedBox(
                  width: 35,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _currentPage = 2;
                      });
                    },
                    child: FaIcon(FontAwesomeIcons.gift, size: 40, color:_currentPage == 2 ? AppColors.bottomNavigationSelectColor : AppColors.bottomNavigationUnselectColor,),
                  ),
                ),
                SizedBox(
                  width: 35,
                  child: InkWell(
                    onTap: (){
                      if(token != null){
                        setState(() {
                          _currentPage = 3;
                        });
                      }else{
                        Get.defaultDialog(
                            titlePadding: EdgeInsets.zero,
                            //contentPadding: EdgeInsets.only(left: 30, right: ),
                            title: "",
                            titleStyle: TextStyle(fontSize: 0),
                            content: Column(
                              children: [
                                Image.asset(
                                  AppConst.noLogin,
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                    width: 200,
                                    child: Center(
                                        child: const Text(
                                          "You need to login first to access your account.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ))),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(), settings: RouteSettings(arguments: {"no registror"})) ),
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xffc54500),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ));
                      }

                    },
                    child: FaIcon(FontAwesomeIcons.user, size: 40, color:_currentPage == 3 ? AppColors.bottomNavigationSelectColor : AppColors.bottomNavigationUnselectColor,),
                  ),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}
