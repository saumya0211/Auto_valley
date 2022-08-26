import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Screens/Welcome_and_LogIn_Up/Sign_Up_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/TextformFieldUI.dart';
import 'package:auto_valley/models/Semi_Circle_Create.dart';
import 'package:auto_valley/models/Taking_Picture/Take_Pic_Down_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formkey = GlobalKey<FormState>();

  void _trySubmit(){
    final isValid = _formkey.currentState!.validate();

    if(isValid){
      _formkey.currentState!.save();
    }
  }

  void updateDataonCloud() async{
    final dataProvider = Provider.of<Data>(context,listen: false);

    try{
      final currentUser = await FirebaseAuth.instance.currentUser;
      if(currentUser!=null) {
        await FirebaseFirestore.instance.collection('user').doc(
            currentUser.email!).update({
          'name' : dataProvider.name,
          'email' : dataProvider.email,
          'phone' : dataProvider.phonenumber,
          'address' : dataProvider.address,
        });
      }
    }on FirebaseException catch(e){
      print(e.code);
    }catch(e){
      print(e);
    }
}

  void s(){
    ShaderMask(
        shaderCallback: (val){
          return LinearGradient(colors:
          [
            Color(0xff7077fc),
            Color(0xffd783fd),
          ]
          ).createShader(val);
        },
        child: MyArc(diameter: 300));
  }
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<Data>(context,listen: false);
    gender? _Gender = gender.male;
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: - MediaQuery.of(context).size.height/7,
                  child: ShaderMask(
                      shaderCallback: (val){
                        return LinearGradient(colors:
                        [
                          Color(0xff7077fc),
                          Color(0xffd783fd),
                        ]
                        ).createShader(val);
                      },
                      child: MyArc(diameter:MediaQuery.of(context).size.width*1.5 )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10) ,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height/1.3,
                            child: FittedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async{
                                      final imgpath = await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context)=>SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                              child: TakePicDownScreen(docname: 'profile',),
                                            ),
                                          ));
                                      print(imgpath);
                                      if(imgpath!=null) {
                                        setState((){
                                          dataProvider.updateProfileImg(
                                              '$imgpath');
                                        });
                                      }
                                    },
                                    child: CircleAvatar(radius: MediaQuery.of(context).size.width/7.5,
                                      backgroundColor: Color(0xffe9e9e9),
                                      child:dataProvider.profileImgPath!=null? Image.network(dataProvider.profileImgPath!,
                                        width: MediaQuery.of(context).size.width/6,
                                        height: MediaQuery.of(context).size.width/6,
                                        fit: BoxFit.fitWidth,) :
                                      Image.asset('images/profileAvatar.png',
                                        color: Color(0xff3189c8),
                                        fit: BoxFit.fill,) ,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Form(
                                    key: _formkey,
                                    child: Column(
                                      children: [
                                        TextFormFieldUI(
                                            initialValue: dataProvider.name,
                                            inputicon: Icon(Icons.account_circle,color:Color(0xff6476fe),size: 35,),
                                            hintText: 'Username',
                                            hintTextStyle: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                            validatefunction: ValidationBuilder().maxLength(30).build(),
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
                                              dataProvider.updateEmail(value);
                                            },
                                            validatefunction: ValidationBuilder().email().maxLength(40).build(),
                                            isEmail: true,
                                            hintText: 'Email',
                                            initialValue: dataProvider.email,
                                            inputicon: Icon(Icons.email,color: Color(0xff6476fe),size: 35,),
                                            hintTextStyle: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            )),
                                        TextFormFieldUI(
                                            inputicon: Icon(Icons.local_phone,color: Color(0xff6476fe),size: 35,),
                                            hintText: 'Phone Number',
                                            initialValue: dataProvider.phonenumber,
                                            hintTextStyle: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                            validatefunction: ValidationBuilder().phone().build(),
                                            onSave:(value){
                                              if(value == null){
                                                return;
                                              }
                                              dataProvider.updatePhone(value);
                                            }),
                                        TextFormFieldUI(
                                            inputicon: Icon(Icons.add_location,color: Color(0xff6476fe),size: 35,),
                                            hintText: 'Address',
                                            initialValue: dataProvider.address,
                                            hintTextStyle: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                            validatefunction: ValidationBuilder().maxLength(50).build(),
                                            onSave: (value){
                                              if(value == null){
                                                return;
                                              }
                                              dataProvider.updateAddress(value);
                                            }),
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
                                    ButtonVoidCallBack: (){
                                      _trySubmit();
                                      if(_Gender == gender.male){
                                        setState((){
                                          Provider.of<Data>(context,listen: false).updateGender(1);
                                        });
                                      }else{
                                        setState((){
                                          Provider.of<Data>(context,listen: false).updateGender(0);
                                        });
                                      }
                                      updateDataonCloud();
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                    },
                                    buttonChild: Text('Submit',style: GoogleFonts.openSans(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
