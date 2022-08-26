import 'package:auto_valley/models/Trip/Trip_Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripPage extends StatefulWidget {
  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  FocusNode _focusNode = FocusNode();

  String PinCode = '110018';
  String Address = 'WZ-134, Tilak Nagar, New Delhi ';
  String TempAddress = '';
  Color chosenColor = Colors.red;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _focusNode.canRequestFocus = false;
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(

        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          backgroundColor: Color(0xff6476fe),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
          title: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width/4,),
              Text('Trips',style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),),
            ],
          ),
        ),
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
                      TripCard(
                          bikeCompany: 'KTM',
                          vehiclenum: '5448',
                          cost:'572'),

                      SizedBox(height: MediaQuery.of(context).size.height/45,),
                      TripCard(
                          bikeCompany: 'Royal Enfield',
                          vehiclenum: '27890',
                          cost:'10000'),
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
