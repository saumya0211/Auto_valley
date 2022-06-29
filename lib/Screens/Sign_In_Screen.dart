import 'package:auto_valley/Screens/ForgetPassword%20Page/ForgetPassword.dart';
import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Screens/Sign_Up_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/TextformFieldUI.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;

  late String  email = '';
  late String  password = '';

  final _formkey = GlobalKey<FormState>();

  void _trySubmit(){
    final isValid = _formkey.currentState!.validate();

    if(isValid){
      _formkey.currentState!.save();
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
              height: MediaQuery.of(context).size.height/1.8,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.129,
                      child: FittedBox(
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    Text('Welcome Back',style: GoogleFonts.openSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff6476fe),
                    ),),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Center(
                        child: FittedBox(
                          child: Text('Hello there, Log in to continue',style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormFieldUI(
                              onSave: (value){
                                setState((){
                                  email = value!;
                                });
                              },
                              validatefunction: ValidationBuilder().email().build(),
                              isEmail: true,
                              hintText: 'Email',
                              inputicon: Icon(Icons.email_outlined,color: Color(0xff6476fe),),
                              hintTextStyle: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Color(0xff6476fe),
                              )),
                          TextFormFieldUI(
                              isPassword: true,
                              onSave: (value){
                                setState((){
                                  password = value!;
                                });
                              },
                              validatefunction: ValidationBuilder().maxLength(30).minLength(6).build(),
                              hintText: 'Password',
                              inputicon: Icon(Icons.lock_outline,color: Color(0xff6476fe),),
                              hintTextStyle: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Color(0xff6476fe),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width/25,),

                    NavButton(
                        buttoncolor: Color(0xff6476fe),
                        ButtonVoidCallBack: () async{
                          try{
                            _trySubmit();
                            final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                            if(user!=null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            }
                          }on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.all(40),
                                backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                content: Text('No user found for that email',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                  textAlign: TextAlign.center,),
                              ));

                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.all(40),
                                backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                content: Text('Wrong password provided for that user',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                  textAlign: TextAlign.center,),
                              ));
                            }
                          }
                        },
                        buttonChild: Text('Log in',style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),),
                        Height: 50,
                        Width: MediaQuery.of(context).size.width/2.5,),
                       SizedBox(height: MediaQuery.of(context).size.width/45,),
                       TextButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                       },
                           child: Text('Forget Password',style: GoogleFonts.openSans(
                             color: Color(0xff6476fe),
                             fontWeight: FontWeight.w500,
                             fontSize: 16,
                           ),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Don\'t have an account ?',style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        }, child: Text('Sign Up',style: GoogleFonts.openSans(
                          color: Color(0xff6476fe),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width/45,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
