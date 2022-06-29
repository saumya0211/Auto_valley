import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Screens/Sign_In_Screen.dart';
import 'package:auto_valley/Widgets/Moving_Display_Cards.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {


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
            Text('Payment',style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/25,),
                Container(
                  width: MediaQuery.of(context).size.width/1.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/20,
                        width: MediaQuery.of(context).size.width/2,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xff6476fe),
                            child: CircleAvatar(child: Text('\u{20B9}' ,
                              style: TextStyle(color: Color(0xff6476fe)),),
                              backgroundColor: Colors.white,
                              radius: 10,),
                          ),
                          title: Text('Total Amount'),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(child: Text('\u{20B9}' ,
                            style: TextStyle(color: Colors.white),),
                            backgroundColor: Color(0xff6476fe),
                            radius: 12,),
                           SizedBox(width: 5,),
                          Text('572',style: TextStyle(
                            fontSize: 15,
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                Container(
                  width: MediaQuery.of(context).size.width/2.5,
                    child: FittedBox(
                      child: Text('Payment Methods',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height/40,),
                NavButton(
                  buttoncolor: Color(0xff6476fe),
                  ButtonVoidCallBack: (){
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      duration: Duration(seconds: 2),
                      margin: EdgeInsets.all(40),
                      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      content: Text('Your Booking Completed Successfully',style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                        textAlign: TextAlign.center,),
                    ));

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  buttonChild: Text('Cash Payment',style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  Height: 50,
                  Width: MediaQuery.of(context).size.width/1.5,),
                SizedBox(height:MediaQuery.of(context).size.height/45,),
                NavButton(
                  buttoncolor: Color(0xff6476fe),
                  ButtonVoidCallBack: (){

                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      duration: Duration(seconds: 2),
                      margin: EdgeInsets.all(40),
                      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      content: Text('We only Accept Cash Payment',style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                        textAlign: TextAlign.center,),
                    ));
                  },

                  buttonChild: Text('Digital Payment',style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  Height: 50,
                  Width: MediaQuery.of(context).size.width/1.5,),
                SizedBox(height: MediaQuery.of(context).size.height/20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
