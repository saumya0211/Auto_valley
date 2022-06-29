import 'dart:ffi';

import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Providers/Location_provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Terms_and_Cond_Page.dart';
import 'package:auto_valley/Screens/Payment_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/models/Bike_Detail_Field_Card.dart';
import 'package:auto_valley/models/Display_Card.dart';
import 'package:auto_valley/models/PickedColorCircle.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  final String addresss;
  final String pincode;

  FirstPage({
    required this.addresss,
    required this.pincode,
});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FocusNode _focusNode = FocusNode();

  late String  Address = widget.addresss;
  late String pincode = widget.pincode;
  String TempAddress = '';
  Color chosenColor = Colors.red;
  bool terms_cond = false;
  bool handling_Charge = false;
  bool helmet = false;

  late TabController tabController;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Write Location'),
          content: SingleChildScrollView(
            child: TextFormField(
              onChanged: (value){
                setState((){
                  TempAddress = value;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                setState((){
                  Address = TempAddress;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _showColorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a Color!'),
          content: SingleChildScrollView(
            child: Row(
              children: [
                PickedColorCircle(color: Colors.red,onTap: (){
                  setState((){
                    chosenColor =Colors.red;
                  });
                  Navigator.pop(context);
                },),
                SizedBox(width: 5,),
                PickedColorCircle(color: Colors.green,onTap: (){
                  setState((){
                    chosenColor =Colors.green;
                  });
                  Navigator.pop(context);
                },),
                SizedBox(width: 5,),
                PickedColorCircle(color: Colors.purple,onTap: (){
                  setState((){
                    chosenColor =Colors.purple;
                  });
                  Navigator.pop(context);
                },),
              ],
            ) ,
          ),

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataPicker = Provider.of<Data>(context);
    return GestureDetector(
      onTap: (){
        _focusNode.canRequestFocus = false;
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          }
        },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Align(
              alignment: Alignment.topCenter,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/45,),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: MediaQuery.of(context).size.height/2.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height/2.3,
                            width: MediaQuery.of(context).size.width/1.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                  child: Text('Details for KTM',style: TextStyle(
                                    color: Color(0xff6676f5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/45,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/10,
                                      width: MediaQuery.of(context).size.width/1.16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        border: Border.all(color: Color(0xff6475ff),width: 1),
                                      ),
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          BikeDetailFieldCard(
                                              height: MediaQuery.of(context).size.height/18,
                                              width: MediaQuery.of(context).size.width/1.25,
                                              inputIcon: Icon(Icons.location_on_outlined,color: Color(0xff6676f5),),
                                              inputText: TextButton(
                                                onPressed: (){
                                                   _showMyDialog();
                                                },
                                                child: Text('Pickup Location',style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff9d9d9d),
                                                ),),
                                              ),),

                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width/1.3,
                                              child: Text(Address + ' ,'+pincode,style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red,
                                              ),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BikeDetailFieldCard(
                                          height: MediaQuery.of(context).size.height/20,
                                          width: MediaQuery.of(context).size.width/2,
                                          inputIcon: Icon(Icons.airline_seat_recline_extra,color: Color(0xff6676f5),),
                                          inputText: Text('Availability',style: TextStyle(
                                            color: Color(0xff6676f5),
                                          ),)),
                                    ),

                                    SizedBox(width: MediaQuery.of(context).size.width/20,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text('11:37:00 - 23:42:00',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    BikeDetailFieldCard(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/2,
                                        inputIcon: Icon(Icons.color_lens,color: Color(0xff6676f5),),
                                        inputText: FittedBox(
                                          child: Row(
                                            children: [
                                              Text('Color Variants',style: TextStyle(

                                              ),),
                                              SizedBox(width: 4,),
                                              Container(
                                                height: MediaQuery.of(context).size.height/35,
                                                width:  MediaQuery.of(context).size.width/25,
                                                decoration: BoxDecoration(
                                                  color: chosenColor,
                                                  border: Border.all(color: Colors.grey,width: 2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(width: MediaQuery.of(context).size.width/10,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: NavButton(
                                        buttoncolor: Color(0xff6575ff),
                                        ButtonVoidCallBack: (){
                                            _showColorDialog();
                                        },
                                        buttonChild: FittedBox(
                                          child: Text('Pick Color',style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                        ),
                                        Height:MediaQuery.of(context).size.height/25,
                                        Width:  MediaQuery.of(context).size.width/4.5,),
                                    ),
                                  ],
                                ),
                                BikeDetailFieldCard(
                                    height: MediaQuery.of(context).size.height/20,
                                    width: MediaQuery.of(context).size.width/1.2,
                                    inputIcon: Icon(Icons.directions_bike_sharp,color: Color(0xff6676f5),),
                                    inputText: Text('Distance Allowance',style: TextStyle(
                                      color: Color(0xff6676f5),
                                    ),)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BikeDetailFieldCard(
                                          height: MediaQuery.of(context).size.height/20,
                                          width: MediaQuery.of(context).size.width/2,
                                          inputIcon: Icon(Icons.pedal_bike,color: Color(0xff6676f5),),
                                          inputText: Text('Km limit(?)',style: TextStyle(

                                          ),)),
                                    ),

                                    SizedBox(width: MediaQuery.of(context).size.width/20,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text('40 Km Allow',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: MediaQuery.of(context).size.height/3.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height/3.8,
                            width: MediaQuery.of(context).size.width/1.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Trip Schedule',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/45,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/11,
                                    width: MediaQuery.of(context).size.width/1.2,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Start Trip Date And Time',style: TextStyle(
                                          color: Color(0xff6476fe),
                                        ),),
                                        SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height/25,
                                              width: MediaQuery.of(context).size.width/1.2,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Color(0xff6476fe),width: 1),
                                                borderRadius: BorderRadius.all(Radius.circular(6)),
                                              ),
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 4),
                                                    child: Text(dataPicker.startTime),
                                                  ),

                                                  FittedBox(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 2),
                                                      child: IconButton(onPressed: (){},
                                                        icon: Icon(Icons.calendar_today_rounded,color: Color(0xff6476fe),),),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/15.5,
                                    width: MediaQuery.of(context).size.width/1.2,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('End Trip Date And Time',style: TextStyle(
                                          color: Color(0xff6476fe),
                                        ),),
                                        SizedBox(height: 4,),
                                        Container(
                                          height: MediaQuery.of(context).size.height/25,
                                          width: MediaQuery.of(context).size.width/1.2,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Color(0xff6476fe),width: 1),
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                          ),
                                          child:  Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 2),
                                                child: Text(dataPicker.endTime),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(right: 2),
                                                child: FittedBox(
                                                  child: IconButton(onPressed: (){},
                                                    icon: Icon(Icons.calendar_today_rounded,color: Color(0xff6476fe),),),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                      }, child: Text('Change Schedule',style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: MediaQuery.of(context).size.height/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/1.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('Other Details',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BikeDetailFieldCard(
                                          height: MediaQuery.of(context).size.height/20,
                                          width: MediaQuery.of(context).size.width/2,
                                          inputIcon: Icon(Icons.directions_bike,color: Color(0xff6676f5),),
                                          inputText: Text('No. of Helmets(1)',style: TextStyle(

                                          ),)),
                                    ),

                                    SizedBox(width: MediaQuery.of(context).size.width/12,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Row(
                                        children: [
                                          Text('Rs. 60/-'),
                                          SizedBox(width: 4,),
                                          Checkbox(
                                              value: helmet,
                                              onChanged: (newvalue){
                                                setState((){
                                                  helmet=!helmet;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BikeDetailFieldCard(
                                          height: MediaQuery.of(context).size.height/20,
                                          width: MediaQuery.of(context).size.width/2,
                                          inputIcon: Icon(Icons.shield,color: Color(0xff6676f5),),
                                          inputText: Text('Handling Charge',style: TextStyle(

                                          ),)),
                                    ),

                                    SizedBox(width: MediaQuery.of(context).size.width/12,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Row(
                                        children: [
                                          Text('Rs. 50/-'),
                                          SizedBox(width: 4,),
                                          Checkbox(
                                              value: handling_Charge,
                                              onChanged: (newvalue){
                                                setState((){
                                                  handling_Charge=!handling_Charge;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BikeDetailFieldCard(
                                          height: MediaQuery.of(context).size.height/20,
                                          width: MediaQuery.of(context).size.width/2,
                                          inputIcon: Icon(Icons.file_copy_outlined,color: Color(0xff6676f5),),
                                          inputText: Text('Document Status',style: TextStyle(

                                          ),)),
                                    ),

                                    SizedBox(width: MediaQuery.of(context).size.width/12,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text('Not Uploaded',style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('* Exclude Fuel'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                      Card(
                        elevation: 20,
                        child:Container(
                          height: MediaQuery.of(context).size.height/16,
                          width: MediaQuery.of(context).size.width/1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text('I Agree to Auto Vally',style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                  ),),
                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndCondPage()));
                                  },
                                      child: Text('Terms and Conditions',style: TextStyle(
                                        color: Color(0xff6476fe),
                                        fontSize: 12,
                                      ),)),
                                ],
                              ),

                              Checkbox(value: terms_cond, onChanged: (newvalue){
                                setState((){
                                  terms_cond=!terms_cond;
                                });
                              }),
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                      Card(
                        elevation: 20,
                        child:Container(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.discount_outlined,color: Color(0xff6476fe),),

                          Container(
                            height: MediaQuery.of(context).size.height/8,
                            width: MediaQuery.of(context).size.width/2.2,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom + 10) ,
                              child: CustomScrollView(
                                slivers: [
                                SliverFillRemaining(
                                hasScrollBody: false,
                                child: Container(
                                  height: MediaQuery.of(context).size.height/8,
                                  width: MediaQuery.of(context).size.width/2.2,
                                  child: TextField(
                                    focusNode: _focusNode,
                                    decoration: InputDecoration(
                                      hintText: 'Enter PromoCode',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:Color(0xff6476fe),width: 1 ),
                                      ),
                                    ),
                                  ),
                                ),
                                ),
                              ]
                              ),
                             ),
                          ),

                              NavButton(
                                boxBorder: Border.all(color:  Color(0xff6476fe),width: 1),
                                buttoncolor: Colors.white,
                                ButtonVoidCallBack: (){},
                                buttonChild: FittedBox(
                                  child: Center(child: Text('Apply',style: TextStyle(
                                    color: Color(0xff6476fe),
                                  ),),),
                                ),
                                Height: MediaQuery.of(context).size.height/28,
                                Width: MediaQuery.of(context).size.width/5, )
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Payable Amount',style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),),
                                    Text('Rs. 572',style: TextStyle(
                                      color:  Color(0xff6476fe),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Ride Amount',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                    Text('Rs. 400',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tax 18% CGST(9%) + SGST(9%) ',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                    Text('Rs. 72',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Security Deposit [Refundable]',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                    Text('Rs. 100',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                      NavButton(
                        buttoncolor: Color(0xff6476fe),
                        ButtonVoidCallBack: (){
                          if(terms_cond) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PaymentScreen()));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(40),
                              backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              content: Text('Accept Terms And Conditions',style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.center,),
                            ));
                          }
                        },
                        buttonChild: Text('Payment',style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),),
                        Height: 50,
                        Width: MediaQuery.of(context).size.width/2.5,),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/10,),
                ],
              )),
        ),
      ),
    );
  }
}
