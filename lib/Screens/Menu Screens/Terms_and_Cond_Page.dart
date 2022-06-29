import 'package:auto_valley/models/Parking/Parking_Details_Picker_Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndCondPage extends StatelessWidget {

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
            SizedBox(width: MediaQuery.of(context).size.width/6,),
            Text('Terms And Conditions',style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width/1.1267,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width/1.127,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Text('Referral Terms & Conditions',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xff6476fe),
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Text('• A user of a AutoVally who invites his/her friends'
                    ' to transact on AutoVally by sharing his/her referral'
                    'code shall be termed as the Referrer and the'
                    'person who receives termed as Referee.',style:
                  TextStyle(fontSize: 17.1,),),
                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• Subject to the terms and conditions mentioned'
                    ' herein, the referral rewards shall be the following:',style:
                TextStyle(fontSize: 17.1,),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('• While the referee sign-up, use the referrers code and'
                          ' transact with AutoVally through web or App the referee'
                          ' and referrer both can avail 25 points which is non'
                          ' transferable.',style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                      ),),

                      SizedBox(height: 10,),

                      Text('• When the referrer and referee at the time of booking,'
                          ' redeem 50% points of your Vehicle booking through'
                          ' your wallet points.',style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                      ),),

                      SizedBox(height: 10,),

                      Text('• When the user make the booking and simultaneously'
                          ' cancel the booking he/she cannot avail the points , he'
                          ' will get only 50% of amount booking.',style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/43,),

                Text('• Its only the promotional activity run by Tenpins'
                    ' Innovation Pvt Ltd offers can be change time to'
                    ' time and end at any time.',style: TextStyle(
                  fontSize: 17.1,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
