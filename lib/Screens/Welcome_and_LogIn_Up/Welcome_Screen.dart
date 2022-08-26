import 'package:auto_valley/Screens/Welcome_and_LogIn_Up/Sign_In_Screen.dart';
import 'package:auto_valley/Widgets/Moving_Display_Cards.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.topCenter,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/15),
                Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('images/auto_vally_logo.jpeg',fit: BoxFit.fill,).image,
                      ),
                    ),),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                FittedBox(
                  child: Text('Book bike anywhere right from your\n smartphone',
                    textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.grey,
                  ),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/50,),
                NavButton(
                  buttoncolor: Color(0xff6476fe),
                  ButtonVoidCallBack: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                    Get.to(()=>SignInScreen(),transition: Transition.fade,duration: Duration(milliseconds: 400) ,curve: Curves.ease);
                  },
                  buttonChild: Text('Get Started',style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  Height: 50,
                  Width: MediaQuery.of(context).size.width/2.5,),

                SizedBox(height: MediaQuery.of(context).size.height/37.5,),
                Container(
                  height: MediaQuery.of(context).size.height/3.97,
                  child: MovingDisplayCards(
                    height: MediaQuery.of(context).size.height/4.7,
                  ),
                ),

                SizedBox(height: 3,),
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                    child: Image.asset('images/auto_vally_bg.jpeg' ,fit: BoxFit.fill,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
