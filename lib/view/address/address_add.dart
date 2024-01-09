import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:resturentapp/controller/location_cotroller.dart';
import 'package:resturentapp/controller/orderController.dart';
import 'package:resturentapp/utility/colors.dart';
import 'package:resturentapp/viewController/alertController.dart';
import 'package:resturentapp/viewController/appBackButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/quote_model.dart';

class AddressAdd extends StatefulWidget {
  final String? pickup_address;
  final String? pickup_phone_number;
  final String? pickup_external_store_id;
  final String? resturentname;
  final List<Map<String, dynamic>>? order_items;
  const AddressAdd({Key? key,  this.pickup_address,  this.pickup_phone_number,  this.pickup_external_store_id,  this.order_items, this.resturentname}) : super(key: key);

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {

  //text controller
  final _country = TextEditingController();
  final _state = TextEditingController();
  final _city = TextEditingController();
  final _location = TextEditingController();
  final _locationDetails = TextEditingController();
  final pickup_phone_number = TextEditingController();
  final pickup_business_name = TextEditingController();

  var selectedCountryIso;
  var selectedStateIso;
  var selectedCity;

  //selected address
  List _selectedAddress = ["1425 Golden Ranch"];
  //address list
  List _addressList = [
    "1425 Golden Ranch",
    "Garzê Tibetan Autonomous Prefecture...",
    "Chamdo, Tibet, China"
  ];

  List<Map<String, dynamic>> _allCountry = [];
  _getCountry()async{
    var res = await LocationController.getCountryListController();
    var data = jsonDecode(res.body);
    for(var i = 0; i<data.length; i++){
      setState(() {
        _allCountry.add(data[i]);
      });
    }
  }

  //all state
  List<Map<String, dynamic>> _allState = [];
  _getState({required String countryIso2})async{
    var res = await LocationController.getStateListController(countryIso2: countryIso2);
    var data = jsonDecode(res.body);
    for(var i = 0; i<data.length; i++){
      setState(() {
        _allState.add(data[i]);
      });
    }
  }


  //all state
  List<Map<String, dynamic>> _allCity = [];
  _getCity({required String countryIso2, required String stateIso2})async{
    var res = await LocationController.getCityListController(countryIso2: countryIso2, stateIso2: stateIso2);
    var data = jsonDecode(res.body);
    for(var i = 0; i<data.length; i++){
      setState(() {
        _allCity.add(data[i]);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCountry();
    print("Constacture pickup_phone_number values ===== ${widget.pickup_phone_number}");
    print("Constacture pickup_address values ===== ${widget.pickup_address}");
    print("Constacture resturentname values ===== ${widget.resturentname}");
    print("Constacture order_items values ===== ${widget.order_items}");
    print("Constacture  pickup_external_store_id values ===== ${widget.pickup_external_store_id}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.dark,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Center(
                  child: Text("Address",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Delivery Address",
                    //   style: TextStyle(
                    //     fontSize: 17,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    // Container(
                    //  // height: 30,
                    //   padding: EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(width: 1, color: AppColors.mainColor)
                    //   ),
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: _addressList.length,
                    //     itemBuilder: (_,index){
                    //       return InkWell(
                    //         onTap: (){
                    //          setState(() {
                    //            _selectedAddress.clear();
                    //            _selectedAddress.add(_addressList[index]);
                    //          });
                    //         },
                    //         child: Container(
                    //           padding: EdgeInsets.all(10),
                    //           margin: EdgeInsets.only(bottom: 10),
                    //           decoration: BoxDecoration(
                    //               color: _selectedAddress.contains(_addressList[index])? AppColors.mainColor.withOpacity(0.2) : Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: _selectedAddress.contains(_addressList[index])? Border.all(width: 1, color: AppColors.mainColor) :Border.all(width: 0, color: Colors.white)
                    //           ),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text("${_addressList[index]}"),
                    //               _selectedAddress.contains(_addressList[index])? Icon(Icons.check, size: 15,) : Center(),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   )
                    // ),
                    //
                    // SizedBox(height: 40),
                    Text("New Address",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _country,
                      onTap: ()=>_openCountry(),
                      readOnly:  true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        suffixIcon: Icon(Icons.arrow_circle_down_outlined, color: Colors.grey,),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: "Select Country",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _state,
                      onTap: ()=>_openState(),
                      readOnly:  true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        suffixIcon: Icon(Icons.arrow_circle_down_outlined, color: Colors.grey,),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: "Select State",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _city,
                      onTap: ()=>_openCity(),
                      readOnly:  true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        suffixIcon: Icon(Icons.arrow_circle_down_outlined, color: Colors.grey,),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: "Select City",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _location,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                          ),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: "Location",
                      ),
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      controller: pickup_phone_number,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: AppColors.mainColor)
                        ),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: "Phone Number",
                      ),
                    ),
                    SizedBox(height: 50,),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: ()=>addingNewAddress(),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: isAddingLocation ? CircularProgressIndicator(color: Colors.white,) : Text("Add this location",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: AppBackButton(size: MediaQuery.of(context).size, onClick: ()=>Navigator.pop(context, quoteResult)),
        ),
      ),
    );
  }


  //open country
  Future<void> _openCountry() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Country'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height-200,
            width: double.infinity,
            child: StatefulBuilder(
              builder: (context, setState){
                return SizedBox(
                  height: 500,
                  width: 300,
                  child: _allCountry.isEmpty ? Center(child: Text("No Country Found."),):ListView.builder(
                    itemCount: _allCountry.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index){
                      return ListTile(
                        onTap: (){
                          _getState(countryIso2: _allCountry[index]["iso2"]);
                          setState((){
                            _country.text =  _allCountry[index]["name"];
                            selectedCountryIso = _allCountry[index]["iso2"];
                          });
                          Navigator.pop(context);
                        },
                        title: Text("${_allCountry[index]["name"]}"),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //open country
  Future<void> _openState() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select State'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height-200,
            width: double.infinity,
            child: StatefulBuilder(
              builder: (context, setState){
                return SizedBox(
                  height: 500,
                  width: 300,
                  child: _allState.isEmpty ? Center(child: Text("No State Found."),): ListView.builder(
                    itemCount: _allState.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index){
                      return ListTile(
                        onTap: (){
                          _getCity(countryIso2: selectedCountryIso, stateIso2: _allState[index]["iso2"]);
                          setState((){
                            _state.text =  _allState[index]["name"];
                            selectedStateIso =  _allState[index]["iso2"];
                          });
                          Navigator.pop(context);
                        },
                        title: Text("${_allState[index]["name"]}"),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //open country
  Future<void> _openCity() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select City'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height-200,
            width: double.infinity,
            child: StatefulBuilder(
              builder: (context, setState){
                return SizedBox(
                  height: 500,
                  width: 300,
                  child: _allCity.isEmpty ? Center(child: Text("No City Found."),): ListView.builder(
                    itemCount: _allCity.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index){
                      return ListTile(
                        onTap: (){
                          setState((){
                            _city.text =  _allCity[index]["name"];
                          });
                          Navigator.pop(context);
                        },
                        title: Text("${_allCity[index]["name"]}"),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  //adding new location
  bool isAddingLocation = false;
  var quoteResult;
  addingNewAddress() async{
    setState(() => isAddingLocation = true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var first_name = _pref.getString("first_name");
    var last_name = _pref.getString("last_name");

    print("drop location === ${"${_location.text}, ${_city.text}, ${_state.text}, ${_country.text}"}");
    print("pcikup location === ${"${widget.pickup_address}"}");
    if(_location.text.isNotEmpty){ // is location is not emply
      var createQuote = await OrderController.createQuote(
          dropoff_address: "${_location.text}, ${_city.text}, ${_state.text}, ${_country.text}",
          dropoff_phone_number: pickup_phone_number.text,
          pickup_address: widget.pickup_address!,
          pickup_phone_number: widget.pickup_phone_number!,
          pickup_business_name: widget.resturentname!,
          first_name: first_name!,
          last_name: last_name!,
          pickup_external_store_id: widget.pickup_external_store_id!,
          order_items: widget.order_items!
      );
      print("createQuote response === ${createQuote.body}");
      print("createQuote response === ${createQuote.statusCode}");
      if(createQuote.statusCode == 200){
        quoteResult = QuoteCreateModel.fromJson(jsonDecode(createQuote.body));
        ///TODO:: We need to save this address, we dont have this apis right now, so we need to save it in our local server
        setState(() {

          _addressList.add(_location.text);//add new location into addres list
          _selectedAddress.clear(); //clear the selected addedd
          _selectedAddress.add(_location.text); // and added new address into selected address list, so that updated addredd will be shown up.
        });

        AlertController.snackBar(text: "New location added and Selected. Now go back to make order.", context: context, bg: Colors.green);
        _location.clear();
        Navigator.pop(context, quoteResult); ///once we are success, then navigate to cart screen.
        setState(() => isAddingLocation = false);
      }else{
        setState(() => isAddingLocation = false);
        AlertController.snackBar(text: "We can not delivery on this location. Change your delivery address.", context: context, bg: Colors.red);

      }
      setState(() => isAddingLocation = false);

    }
  
  }
}
