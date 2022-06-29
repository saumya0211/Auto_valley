import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Screens/Menu%20Screens/CancellationsAndMod_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Coupon_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Insurance_Policy_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Privacy_Policy_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Profile_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Parking_List_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Terms_and_Cond_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Trips_Page.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Upload_Documents.dart';
import 'package:auto_valley/Screens/Sign_In_Screen.dart';
import 'package:auto_valley/models/MenuFieldTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MenuScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final dataProvider = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(radius: MediaQuery.of(context).size.width/8,
                      backgroundColor: Color(0xffe9e9e9),
                      child: dataProvider.profileImgPath!=null? Image.network(dataProvider.profileImgPath!,
                        height: MediaQuery.of(context).size.width/6.5,
                        width: MediaQuery.of(context).size.width/6.5,
                        fit: BoxFit.fitWidth,)
                          :Image.asset('images/profileAvatar.png',color: Color(0xff3189c8),),),
                      SizedBox(width: MediaQuery.of(context).size.height/30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dataProvider.name,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                          Text('Phone Number :'),
                          Text(dataProvider.phonenumber),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff6476fe),thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MenuFieldTile(
                        icon: Icons.account_circle_outlined,
                        title: 'Profile',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.location_on_outlined,
                        title: 'Trip',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TripPage()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.local_parking,
                        title: 'Parking',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ParkingListScreen()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.upload_rounded,
                        title: 'Uploaded Documents',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DocUploadScreen()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.card_giftcard,
                        title: 'Coupons',
                        onTap: ()async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CouponScreen()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.share_outlined,
                        title: 'Tell a Friend',
                        onTap: (){
                          Share.share('check out my website https://example.com');
                        },
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff6476fe),thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MenuFieldTile(
                        icon: Icons.shield_outlined,
                        title: 'Terms and Conditions',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndCondPage()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.fact_check_outlined,
                        title: 'Insurance Policy',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InsurancePolicyPage()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.cancel_outlined,
                        title: 'Cancellations & Modifications',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CancelAndModPage()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Privacy & Policy',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyPage()));
                        },
                      ),
                      MenuFieldTile(
                        icon: Icons.logout,
                        title: 'Log Out',
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()),(Route<dynamic> route) => false);
                        },
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
