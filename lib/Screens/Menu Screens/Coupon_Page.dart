import 'package:auto_valley/models/Coupon_Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponScreen extends StatelessWidget {


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
            SizedBox(width: MediaQuery.of(context).size.width/5,),
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
             CouponCard(
                 discount: '70%',
                 couponcode: 'CW4578W758',
                 desc: 'Coupon is Valid for 3 days',
                 daysLeft: '2',
                 expdate: '2022-06-21'),
              CouponCard(
                  discount: '70%',
                  couponcode: 'CW4578W758',
                  desc: 'Coupon is Valid for 3 days',
                  daysLeft: '2',
                  expdate: '2022-06-21'),
              CouponCard(
                  discount: '50%',
                  couponcode: 'VIJAY50',
                  desc: 'Good ride',
                  daysLeft: '1',
                  expdate: '2022-06-21'),
            ],
          ),
        ),
      ),
    );
  }
}
