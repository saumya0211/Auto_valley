import 'package:auto_valley/Screens/Welcome_and_LogIn_Up/Sign_In_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.127,
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.8,
                    child: FittedBox(
                      child: Text('Forget Password',style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff6476fe),
                      ),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    child: FittedBox(
                      child: Text(' Please enter the OTP sent to your \nEmail ID',style: GoogleFonts.openSans(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,),
                    ),
                  ),
                  SizedBox(height: 10,),
                 Pinput(
                   length: 6,
                   onCompleted: (value){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                   },
                 ),

                  SizedBox(height: MediaQuery.of(context).size.width/28,),
                  NavButton(
                    buttoncolor: Color(0xff6476fe),
                    ButtonVoidCallBack: (){},
                    buttonChild: Text('Confirm',style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                    Height: 50,
                    Width: MediaQuery.of(context).size.width/2.5,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
