import 'package:auto_valley/models/Parking/Parking_Details_Picker_Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkingListScreen extends StatelessWidget {
  const ParkingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('Parking List',style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/1.126,
          child: ListView(
            children: [
              ParkingDetailsPickerCard(text:'west delhi'),
              ParkingDetailsPickerCard(text:'Admin Howrah'),
            ],
          ),
        ),
      ),
    );
  }
}
