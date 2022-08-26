import 'package:auto_valley/Screens/ForgetPassword%20Page/OTP_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/TextformFieldUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {

   final _auth = FirebaseAuth.instance;

   final _formkey = GlobalKey<FormState>();

   void _trySubmit(){
     final isValid = _formkey.currentState!.validate();

     if(isValid){
       _formkey.currentState!.save();
     }
   }

  Future<void> resetPassword({
    required String email,
    required BuildContext context}) async {
    try {

      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) => Get.back);
    }on FirebaseException catch(e){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(40),
      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Text(e.code,style: TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
        textAlign: TextAlign.center,),
    ));
    }catch(e){
      print(e);
    }

  }

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
                      child: Text('Please enter the email address you\'d like your Password\nreset information sent to',style: GoogleFonts.openSans(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Form(
                    key: _formkey,
                    child: TextFormFieldUI(
                        onSave: (value)async{
                          print(value);
                          if(value!=null) {
                             await resetPassword(
                                email: value,
                                context: context);
                          }
                        },
                        validatefunction: ValidationBuilder().email().build(),
                        isEmail: true,
                        hintText: 'Email',
                        inputicon: Icon(Icons.email_outlined,color: Color(0xff6476fe),),
                        hintTextStyle: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: Color(0xff6476fe),
                        )),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width/28,),
                  NavButton(
                    buttoncolor: Color(0xff6476fe),
                    ButtonVoidCallBack: (){
                     _trySubmit();
                    },
                    buttonChild: Text('Send',style: GoogleFonts.openSans(
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
