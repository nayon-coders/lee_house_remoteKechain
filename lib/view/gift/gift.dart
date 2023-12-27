import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:resturentapp/view/orders/orders.dart';
import 'package:resturentapp/viewController/appButton.dart';
import 'package:resturentapp/viewController/rewardBox.dart';

class Gift extends StatefulWidget {
  const Gift({Key? key}) : super(key: key);

  @override
  State<Gift> createState() => _GiftState();
}

class _GiftState extends State<Gift> {


  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                width: size.width*.55,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor
                ),
                child: const Center(
                  child: Text("Good Morning, User",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 1.5
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: ()=>Get.to(OrdersList()),
                child: Container(
                    width: size.width*.12,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    border: Border.all(width: 1, color: AppColors.secColor)
                  ),
                  child: Center(
                    child: Icon(Icons.list_alt, size: 30,)
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigationBar(pageIndex: 3,))),
                child: Container(
                  width: size.width*.12,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                      border: Border.all(width: 1, color: AppColors.mainColor)
                  ),
                  child: Center(
                      child: Icon(Icons.person, color: AppColors.white, size: 30,)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          RewardBox(),
          SizedBox(height: 20,),
          //
          // //progress detqails
          // Text("Progress Details ",
          //   style: TextStyle(
          //     fontSize: 17,
          //     fontWeight: FontWeight.w400,
          //     color: AppColors.white,
          //   ),
          // ),
          // SizedBox(height: 10,),
          // SingleRewardProgress(
          //   text: "5\$ Discount on next meal",
          //   status: "Complete",
          //   statusColor: AppColors.mainColor,
          //   percent: 1,
          // ),
          // SizedBox(height: 10,),
          // SingleRewardProgress(
          //   text: "10\$ Discount on next meal",
          //   status: "Redeem",
          //   statusColor: AppColors.secColor,
          //   percent: 1,
          // ),
          // SizedBox(height: 10,),
          // SingleRewardProgress(
          //   text: "20\$ Discount on next meal",
          //   status: "In Progress",
          //   statusColor: AppColors.mainColor.withOpacity(0.6),
          //   percent: 0.53,
          // ),
          // SizedBox(height: 10,),
          // SingleRewardProgress(
          //   text: "30\$ Discount on next meal",
          //   status: "In Progress",
          //   statusColor: AppColors.mainColor.withOpacity(0.6),
          //   percent: 0.23,
          // ),
          // SizedBox(height: 10,),
          // SingleRewardProgress(
          //   text: "Free Meal on Next Order",
          //   status: "In Progress",
          //   statusColor: AppColors.mainColor.withOpacity(0.6),
          //   percent: 0.0,
          // ),










          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.mainColor
            ),
            child: Text("Membership Card",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                letterSpacing: 1.5
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    border: Border.all(width: 2, color: AppColors.mainColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text("Continuous Monthly Subscription",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            letterSpacing: 1.4,
                            color: Colors.black
                          ),
                        ),
                      Text("CA\$9.9",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            letterSpacing: 1.4,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                      border: Border.all(width: 2, color: AppColors.mainColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("One Month \nSubscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            letterSpacing: 1.4,
                            color: Colors.black
                        ),
                      ),
                      Text("CA\$15.9",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            letterSpacing: 1.4,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                border: Border.all(width: 2, color: AppColors.mainColor)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8, height: 8,
                      decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBox(width: 10,),
                    Text("Recieve Complementary \$100 Voucher",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      width: 8, height: 8,
                      decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBox(width: 10,),
                    Text("Get Weekly bonus", style: TextStyle(
                        color: Colors.black
                    ),),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      width: 8, height: 8,
                      decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBox(width: 10,),
                    Text("Other details about the membership cards", style: TextStyle(
                        color: Colors.black
                    ),),
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            //padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.white,
                border: Border.all(width: 2, color: AppColors.mainColor)
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                materialTapTargetSize:MaterialTapTargetSize.padded,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text("I had read     <<"),
                TextButton(onPressed: (){}, child: Text("User Agreement")),
                const Text(">>"),
              ],
            ),
          ),

          SizedBox(height: 20,),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text("Get it Now \$9.90",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

class SingleRewardProgress extends StatelessWidget {
  const SingleRewardProgress({
    super.key, required this.percent, required this.text, required this.status, required this.statusColor,
  });

  final double percent;
  final String text;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width:2, color: AppColors.mainColor)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$text",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: statusColor
                ),
                child: Text("$status",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          LinearPercentIndicator(
            barRadius: Radius.circular(100),
            width: MediaQuery.of(context).size.width*.80,
            lineHeight: 10.0,
            percent: percent,
            backgroundColor: Colors.grey.shade200,
            progressColor: AppColors.mainColor,
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: Text("${(percent*100).toStringAsFixed(0)}%  complete",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
