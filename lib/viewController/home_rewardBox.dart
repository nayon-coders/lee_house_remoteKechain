import 'package:flutter/material.dart';
import 'package:progress_bar_steppers/steppers.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:resturentapp/utility/colors.dart';

class HomeRewardBox extends StatefulWidget {
  const HomeRewardBox({Key? key,}) : super(key: key);

  @override
  State<HomeRewardBox> createState() => _HomeRewardBoxState();
}

class _HomeRewardBoxState extends State<HomeRewardBox> {


  var currentStep = 3;
  var totalSteps = 0;
  final stepsData = [
    StepperData(
      label: '500',
    ),
    StepperData(
      label: '1000',
    ),
    StepperData(
      label: '2000',
    ),
    StepperData(
      label: "3000",
    ),
    StepperData(
      label: "5000",
    ),

  ];


  @override
  void initState() {
    totalSteps = stepsData.length;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      width: size.width,
      height: 55,
      //margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 4, color: AppColors.mainColor)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reward Progress",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star_border_outlined, color: Colors.amber, size: 25,),
                  Text("134",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}

