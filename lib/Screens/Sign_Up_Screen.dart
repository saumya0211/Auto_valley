import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Sign_In_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/TextformFieldUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


enum gender { male, female }
class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();

  void _trySubmit(){
    final isValid = _formkey.currentState!.validate();

    if(isValid){
      _formkey.currentState!.save();
    }
  }
  final _auth = FirebaseAuth.instance;
  String ? _email;
  late String confirmpassword = '';
  late  String  _password ;
  gender? _Gender = gender.male;
  late String tempPassWord = '';

  void verify(BuildContext context) async{

    try{
      final dataProvider = Provider.of<Data>(context,listen: false);
      print(_email);
      print(tempPassWord);
      final newUser = await _auth.createUserWithEmailAndPassword(email: _email!, password: _password);
      if(newUser!=null){
        dataProvider.updatePassword(_password);
        dataProvider.updateEmail(_email!);
        await FirebaseFirestore.instance.collection('user').doc(dataProvider.email).set(
          {
            'name' : dataProvider.name,
            'email' : dataProvider.email,
            'phone' : dataProvider.phonenumber,
            'address' : dataProvider.address,
          }
        );

        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
      }
    } on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(40),
          backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text('The password provided is too weak',style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
            textAlign: TextAlign.center,),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(40),
          backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text('The account already exists for that email',style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
            textAlign: TextAlign.center,),
        ));
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<Data>(context,listen: false);

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10) ,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.127,
                        height: MediaQuery.of(context).size.height/1.3,
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
                              SizedBox(height: MediaQuery.of(context).size.height/38,),
                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: FittedBox(
                                  child: Text('Hello there, Sign Up to continue',style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  ),),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    TextFormFieldUI(
                                        inputicon: Icon(Icons.account_circle_outlined,color:Color(0xff6476fe),),
                                        hintText: 'Username',
                                        hintTextStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff6476fe),
                                        ),
                                        validatefunction: ValidationBuilder().maxLength(35,'Maximum allowed 40 letters').minLength(5,'Letters less than 5').build(),
                                        onSave: (value){
                                          if(value == null){
                                            return;
                                          }
                                          dataProvider.updateName(value);
                                        }),
                                    TextFormFieldUI(
                                        onSave: (value){
                                          if(value == null){
                                            return;
                                          }
                                          setState((){
                                            _email = value;
                                          });
                                        },
                                        validatefunction: ValidationBuilder().email().build(),
                                        isEmail: true,
                                        hintText: 'Email',
                                        inputicon: Icon(Icons.email_outlined,color: Color(0xff6476fe),),
                                        hintTextStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff6476fe),
                                        )),
                                    TextFormFieldUI(
                                        inputicon: Icon(Icons.local_phone_outlined,color: Color(0xff6476fe),),
                                        hintText: 'Phone Number',
                                        hintTextStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff6476fe),
                                        ),
                                        validatefunction: ValidationBuilder().phone().build(),
                                        onSave:(value){
                                          if(value == null){
                                            return;
                                          }
                                          dataProvider.updatePhone(value);
                                        }),
                                    TextFormFieldUI(
                                        inputicon: Icon(Icons.location_on_outlined,color: Color(0xff6476fe),),
                                        hintText: 'Address',
                                        hintTextStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff6476fe),
                                        ),
                                        validatefunction: ValidationBuilder().maxLength(50).minLength(5).build(),
                                        onSave: (value){
                                          if(value == null){
                                            return;
                                          }
                                          dataProvider.updateAddress(value);
                                        }),
                                    TextFormFieldUI(
                                        isPassword: true,
                                        onSave: (value){
                                          setState((){
                                            tempPassWord = value!;
                                            print(tempPassWord);
                                          });
                                        },
                                        validatefunction: ValidationBuilder().maxLength(30).minLength(6).build(),
                                        hintText: 'Password',
                                        inputicon: Icon(Icons.lock_outline,color: Color(0xff6476fe),),
                                        hintTextStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff6476fe),
                                        )),
                                    TextFormFieldUI(
                                        isPassword: true,
                                        onSave: (value){
                                          setState((){
                                            confirmpassword = value!;
                                            print(confirmpassword);
                                          });
                                        },
                                        validatefunction: ValidationBuilder().maxLength(30).minLength(6).build(),
                                        hintText: 'Confirm Password',
                                        inputicon: Icon(Icons.check_circle_outline,color: Color(0xff6476fe),),
                                        hintTextStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff6476fe),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height/30,),
                              Container(
                                width: MediaQuery.of(context).size.width/1.5,
                                height: MediaQuery.of(context).size.height/25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Radio<gender>(
                                          splashRadius: 15,
                                          activeColor: Color(0xff6476fe),
                                          value: gender.male,
                                          groupValue: _Gender,
                                          onChanged: (gender? value) {
                                            setState(() {
                                              _Gender = value;
                                            });
                                          },

                                        ),
                                        Text('Male'),
                                      ],),

                                    SizedBox(width: 5,),
                                    Row(
                                      children: [
                                        Radio<gender>(
                                          activeColor: Color(0xff6476fe),
                                          value: gender.female,
                                          groupValue: _Gender,
                                          onChanged: (gender? value) {
                                            setState(() {
                                              _Gender = value;
                                            });
                                          },

                                        ),
                                        Text('Female'),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 7,),
                              NavButton(
                                buttoncolor: Color(0xff6476fe),
                                ButtonVoidCallBack: () {
                                try{
                                  _trySubmit();
                                  if(tempPassWord==confirmpassword){
                                    setState((){
                                      _password = confirmpassword;
                                    });
                                  }
                                  if(_password!=null){
                                    dataProvider.updatePassword(_password);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      duration: Duration(seconds: 2),
                                      margin: EdgeInsets.all(40),
                                      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      content: Text('Password does not match',style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                        textAlign: TextAlign.center,),
                                    ));
                                  }
                                  if(_Gender == gender.male){
                                    setState((){
                                      Provider.of<Data>(context,listen: false).updateGender(1);
                                    });
                                  }else{
                                    setState((){
                                      Provider.of<Data>(context,listen: false).updateGender(0);
                                    });
                                  }

                                  verify(context);
                                }catch(e){
                                  print(e);
                                }
                                },
                                buttonChild: Text('Sign Up',style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                                Height: 50,
                                Width: MediaQuery.of(context).size.width/2.5,),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already Registered!',style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),),
                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                                  }, child: Text('Log In',style: GoogleFonts.openSans(
                                    color: Color(0xff6476fe),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),)),
                                ],
                              ),
                              SizedBox(height: 7),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
