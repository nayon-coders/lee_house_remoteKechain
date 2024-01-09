import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/controller/authController.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/auth/login.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/viewController/alertController.dart';

import '../../viewController/appBackButton.dart';
import '../../viewController/appButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ///////// global key ///////////
  final loginGlobalKey = GlobalKey<FormState>();

  /////////// input controller ///////////
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();


  late bool _passwordShowHide;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordShowHide = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30, right: 30, top: size.height*.10, bottom: 30),
        child: Form(
          key: loginGlobalKey,
          child: Column(
            children: [
              Text("Register your account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 40,),
              TextFormField(
                style: TextStyle(
                    color: Colors.black
                ),
                controller: firstName,
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
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "First name must not be empty.";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                style: TextStyle(
                    color: Colors.black
                ),
                controller: lastName,
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
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Last Name must not be empty.";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                style: TextStyle(
                    color: Colors.black
                ),
                controller: email,
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
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Email must not ne empty";
                  }else if(!v!.contains("@")){
                    return "Email is not valid";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                style: TextStyle(
                    color: Colors.black
                ),
                controller: phone,
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
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Phone number must not be empty";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                style: TextStyle(
                    color: Colors.black
                ),
                obscureText: _passwordShowHide,
                controller: password,
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
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: ()=>setState(() => _passwordShowHide = !_passwordShowHide),
                      icon: Icon(
                        _passwordShowHide ?  Icons.visibility_off : Icons
                            .visibility,
                        color: AppColors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Password must not be empty.";
                  }else if(v!.isNumericOnly){
                    return "Only numeric not allow. Please try to Alpha & Numeric both.";
                  }else if(v!.length>9){
                    return "Password must be 8 charter or more.";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                style: TextStyle(
                    color: Colors.black
                ),
                obscureText: _passwordShowHide,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:const BorderSide(width: 1, color: AppColors.mainColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:const BorderSide(width: 1, color: AppColors.mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:const BorderSide(width: 1, color: AppColors.mainColor),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                      onPressed: ()=>setState(() => _passwordShowHide = !_passwordShowHide),
                      icon: Icon(
                        _passwordShowHide ?  Icons.visibility_off : Icons
                            .visibility,
                        color: AppColors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Confirm password must not be empty.";
                  }else if(v != password.text){
                    return "Confirm password doesn't same.";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 30,),
              AppButton(
                onClick: ()=>isLoading? null: _signup(),
                text: "Register",
                isLoading: isLoading,
              ),
              SizedBox(height: 40,),
              Text("You can also sign up with.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),

              SizedBox(height: 20,),
              Container(
                width: size.width,
                padding: EdgeInsets.all(7),

                margin: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: size.width*.20,
                          height: size.width*.20,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: AppColors.mainColor)
                          ),
                          child: Icon(Icons.email, size: 40, color: AppColors.mainColor,),
                        ),
                        SizedBox(height: 5,),
                        Text("Gmail",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: size.width*.20,
                          height: size.width*.20,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: AppColors.mainColor)
                          ),
                          child: Icon(Icons.facebook, size: 40, color: AppColors.mainColor,),
                        ),
                        SizedBox(height: 5,),
                        Text("Facebook",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: size.width*.20,
                          height: size.width*.20,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: AppColors.mainColor)
                          ),
                          child: Icon(Icons.alternate_email, size: 40, color: AppColors.mainColor,),
                        ),
                        SizedBox(height: 5,),
                        Text("Mail",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBackButton(size: size, onClick: ()=>Get.back(),),

    );
  }


  ////////////////// signup method ///////////////
  bool isLoading = false;
  _signup() async{
    setState(() =>isLoading = true);
    if(loginGlobalKey!.currentState!.validate()){
      var data = {
        "first_name":firstName.text,
        "last_name":lastName.text,
        "email": email.text,
        "phone" : phone.text,
        "password":password.text,
      };
      var res = await AuthController.signUp(data: data);
      print("res == ${res.statusCode}");
      print("res == ${res.body}");
      if(res.statusCode == 201){
        AlertController.snackBar(text: "Registration Success. Now Login into your account.", context: context, bg: Colors.green);
        Get.to(Login(), transition: Transition.rightToLeft);
      }else{
        AlertController.snackBar(text: "Something went wrong.", context: context, bg: Colors.red);
      }
    }

    setState(() =>isLoading = false);
  }
}
