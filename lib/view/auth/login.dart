import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturentapp/controller/authController.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/auth/signUp.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/viewController/alertController.dart';

import '../../viewController/appBackButton.dart';
import '../../viewController/appButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///////// login global key ////////////
  final loginGlobalKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  late bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
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
              Text("Log-in to your account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 25,
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
              SizedBox(height: 40,),
              TextFormField(
                controller: email,
                style: TextStyle(
                  color: Colors.black
                ),
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
                    return "Email must not be empty";
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
                obscureText: _passwordVisible,
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
                    hintStyle: TextStyle(
                      color: AppColors.black,
                    ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20,)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Password must not be empty";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 30,),
              AppButton(
                onClick: ()=>_login(),
                text: "Login",
                textColor: Colors.white,
                bg: AppColors.mainColor,
                isLoading: isLoading,
              ),
              SizedBox(height: 5,),
              TextButton(
                onPressed: (){},
                child: Text("Don't have an account.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              InkWell(
                onTap: ()=>Get.to(SignUp(), transition: Transition.rightToLeft),
                child: Container(
                  width: 120,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.secColor
                  ),
                  child: Center(
                    child: Text("Register",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBackButton(size: size, onClick: ()=>Get.back(),),
    );
  }

  ////////////// login////////////////
  bool isLoading = false;
  _login() async{
    setState(() =>isLoading = true);
    if(loginGlobalKey!.currentState!.validate()){
      var data = {
        "email" :email.text,
        "password" : password.text,
      };
      var res = await AuthController.singnIn(data: data);
      print("res == ${res.statusCode}");
      print("res == ${res.body}");
      if(res.statusCode == 200){
        Get.offAll(AppBottomNavigationBar(), transition: Transition.fadeIn);
        AlertController.snackBar(text: "Login Success.", context: context, bg: Colors.green);
      }else{
        AlertController.snackBar(text: "Login credential invalid.", context: context, bg: Colors.red);
      }

    }
    setState(() =>isLoading = false);

  }
}


