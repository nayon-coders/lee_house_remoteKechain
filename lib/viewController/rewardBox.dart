import 'package:flutter/material.dart';
import 'package:progress_bar_steppers/steppers.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:resturentapp/utility/colors.dart';

class RewardBox extends StatefulWidget {
  const RewardBox({Key? key,}) : super(key: key);

  @override
  State<RewardBox> createState() => _RewardBoxState();
}

class _RewardBoxState extends State<RewardBox> {


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

  var _lowerValue = 10.00;
  var _upperValue = 100.00;

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
      height: 150,
      //margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.white,
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
                    fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star_border_outlined, color: Colors.amber, size: 25,),
                  Text("134",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  )
                ],
              ),

            ],
          ),
          SizedBox(height: 15,),
          Steppers(
            direction: StepperDirection.horizontal,
            labels: stepsData,
            currentStep: currentStep,
            stepBarStyle: StepperStyle(
              inactiveColor: Colors.grey,
              inactiveLabelTextColor: Colors.grey,
              activeColor:Colors.amber,
              activeBorderColor: Colors.amber,
              maxLineLabel: 1,
              //inactiveColor: StepperColors.ink200s
            ),
          ),

        // Container(
        //     margin: EdgeInsets.only(top: 10,),
        //     alignment: Alignment.centerLeft,
        //     child: RangeSliderFlutter(
        //       // key: Key('3343'),
        //       values: [10, 20, 30, 50, _upperValue],
        //       rangeSlider: true,
        //       tooltip: RangeSliderFlutterTooltip(
        //         alwaysShowTooltip: true,
        //       ),
        //       max: 20000,
        //       textPositionTop: -100,
        //       handlerHeight: 30,
        //       trackBar:RangeSliderFlutterTrackBar(
        //         activeTrackBarHeight: 10,
        //         inactiveTrackBarHeight: 10,
        //         activeTrackBar: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Colors.red,
        //         ),
        //         inactiveTrackBar: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Colors.grey,
        //         ),
        //       ),
        //
        //       min: 0,
        //       fontSize: 15,
        //       textBackgroundColor:Colors.red,
        //       onDragging: (handlerIndex, lowerValue, upperValue) {
        //         _lowerValue = lowerValue;
        //         _upperValue = upperValue;
        //         setState(() {});
        //       },
        //     ),
        //   ),

        ],
      ),
    );
  }
}

