import 'package:auto_valley/models/Parking/Parking_Details_Picker_Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelAndModPage extends StatelessWidget {

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
        title: Align(
          alignment: Alignment.topCenter,
          child: Text('Cancellations & Modifications',style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width/1.1267,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/1.127,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Text('Cancellation Policy As Below',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xff6476fe),
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Text('• A booking can be cancelled by the user through'
                    ' the AutoVally mobile application or'
                    ' website. Alternatively, The user may also contact'
                    ' the customer care and request a cancellation.',style:
                TextStyle(fontSize: 17.1,),),
                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• In case of cancellations prior to 24 hours of pick'
                    ' up time, user will be charged 10% of total'
                    ' transaction amount. the refund will be credited to'
                    ' the user\'s account in 5-6 working days.',style:
                TextStyle(fontSize: 17.1,),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('•  For cancellations made within 24 hours of pick'
                    ' time, user will be charged 25% of'
                    ' the transaction amount. the refund will be credited'
                    ' to the user\'s account in 5-6 working days.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• For cancellations made within 0-6 hours of pick'
                    ' up time, user will be charged 75% of the'
                    ' transaction amount. the refund will be credited to'
                    ' to the user\'s account in 5-6 working days.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• In case a user fails to show up for his/her'
                    ' reservation or cancels the ride 2 hour before the'
                    ' pickup time, the booking shall treated as a no show'
                    ' and no refund will be initiated.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• In case a ride is cancel due to inability to'
                    ' produce a valid documents during ride pickup, 15%'
                    ' deduction will be applicable.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• If a user wishes to cancel his/her booking for'
                    ' covid-19 safety precaution, they will be entitled to'
                    ' full refund to their AutoVally wallet only. This wallet'
                    ' balance can be used to make any bookings'
                    ' on AutoVally in the future.To cancel your booking'
                    ' for this reason, please contact are customer'
                    ' support via email info@AutoVally.com or call'
                    ' 9358711333 (refund will not be done to your bank'
                    ' account/ card/external wallet).',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
