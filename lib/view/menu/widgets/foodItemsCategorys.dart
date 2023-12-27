import 'package:flutter/material.dart';


class FoodItemsCateory extends StatefulWidget {
  const FoodItemsCateory({
    super.key,
  });

  @override
  State<FoodItemsCateory> createState() => _FoodItemsCateoryState();
}

class _FoodItemsCateoryState extends State<FoodItemsCateory> {

  ///////////// empty list for current selection ////////
  // List _selectedItem


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (_, index){
          return Container(
            padding: EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 8),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              color: Colors.grey.shade200,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Category 1",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14
                ),
              ),
            ),
          );
        }
    );
  }
}
