import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/controller/authController.dart';
import 'package:resturentapp/view/address/address_add.dart';
import 'package:resturentapp/viewController/appBackButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utility/colors.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final name = TextEditingController();

  getUserInfo()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      name.text = _pref.getString("username").toString();
    });
  }

  //selected address
  List _selectedAddress = ["1425 Golden Ranch"];
  //address list
  List _addressList = [
    "1425 Golden Ranch",
    "Garzê Tibetan Autonomous Prefecture...",
    "Chamdo, Tibet, China"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; 
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Personal Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(height: 0,),
                TextFormField(
                  controller: name,
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        color: AppColors.mainColor,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Delivery Address",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _addressList.length,
                            itemBuilder: (_, index){
                              return InkWell(
                                onTap: (){
                                  _selectedAddress.clear();
                                  _selectedAddress.add(_addressList[index]);
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color:  _selectedAddress.contains(_addressList[index]) ? AppColors.mainColor : Colors.white,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${_addressList[index]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),

                                      ),
                                      _selectedAddress.contains(_addressList[index]) ?  Icon(Icons.check, color: Colors.black,) : Center(),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      InkWell(
                        onTap: ()=>Get.to(AddressAdd()),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text("+ Add new address",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.blue
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Center(child: Text("Select Default Address",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                )),
                SizedBox(height: 30,),
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffA9DEF9),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        spreadRadius: 3
                      )
                    ]
                  ),
                  child: Center(
                    child: Text("Order history",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Password Reset",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: "Current Password",
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.mainColor,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.mainColor,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20,)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: "New Password",
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.mainColor,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.mainColor,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20,)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(width: 1, color: AppColors.mainColor),
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: "Confirm New Password",
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.mainColor,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.mainColor,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20,)
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffE4C1F9),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            spreadRadius: 3
                        )
                      ]
                  ),
                  child: Center(
                    child: Text("Change Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: ()=>AuthController.logout(),
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                              spreadRadius: 3
                          )
                        ]
                    ),
                    child: Center(
                      child: Text("Log-out",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: AppBackButton(
            onClick: ()=>Get.back(), size: size,
          ),
        ),
      ),
    );
  }
}
