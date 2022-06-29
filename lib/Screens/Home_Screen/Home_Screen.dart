import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Down_Screen.dart';
import 'package:auto_valley/Screens/Home_Screen/Menu_Screen.dart';
import 'package:auto_valley/Screens/Sign_In_Screen.dart';
import 'package:auto_valley/models/Home_Screen/Bike_reach_amount_Card.dart';
import 'package:auto_valley/models/Home_Screen/Calendar_Picker_Card.dart';
import 'package:auto_valley/Widgets/Moving_Display_Cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User ? loggedinUser;
  final _auth = FirebaseAuth.instance;

  void getUserDataFromCloud(String useremail,BuildContext context)async{
    final dataProvider = Provider.of<Data>(context,listen: false);

    try{
      final userData = await FirebaseFirestore.instance.collection('user').doc(useremail).get();
      if(userData.exists){
        dataProvider.updateName(userData['name']);
        dataProvider.updateEmail(userData['email']);
        dataProvider.updatePhone(userData['phone']);
        dataProvider.updateAddress(userData['address']);
      }
    }on FirebaseException catch(e){
      print(e.code);
    }catch(e){
      print(e);
    }
  }

  void getCurrentUser(BuildContext context) async {
    final dataProvider = Provider.of<Data>(context,listen: false);
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;

         getUserDataFromCloud(loggedinUser!.email!, context);

        try{
          final ref =FirebaseStorage.instance.ref().child('user_images').child('${loggedinUser!.email}/profile');
          final profilepath = await ref.getDownloadURL().whenComplete(() => null);
          profilepath!=null ? dataProvider.updateProfileImg(profilepath) : null;
        }on FirebaseException catch(e){
          print(e.code);
        }catch(e){
          print(e);
        }


        try{
          final aadhar =FirebaseStorage.instance.ref().child('user_images').child('${loggedinUser!.email}/Aadhar Card');
          final aadharpath = await aadhar.getDownloadURL().whenComplete(() => null);
          aadharpath!=null ? dataProvider.updateAadharCard(aadharpath) : null;
        }on FirebaseException catch(e){
          print(e.code);
        }catch(e){
          print(e);
        }

        try{
          final drivinglicence =FirebaseStorage.instance.ref().child('user_images').child('${loggedinUser!.email}/Driving Licence');
          final drivinglicencepath = await drivinglicence.getDownloadURL().whenComplete(() => null);
          drivinglicencepath!=null ? dataProvider.updateDrivingLicence(drivinglicencepath):null;
        }on FirebaseException catch(e){
          print(e.code);
        }catch(e){
          print(e);
        }

        try{
          final selfie =FirebaseStorage.instance.ref().child('user_images').child('${loggedinUser!.email}/Selfie');
          final selfiepath = await selfie.getDownloadURL().whenComplete(() => null);
          selfiepath!=null? dataProvider.updateSelfie(selfiepath) : null;

        }on FirebaseException catch(e){
          print(e.code);
        }catch(e){
          print(e);
        }


        dataProvider.updateEmail(loggedinUser!.email!);
        dataProvider.updatePhone(loggedinUser!.phoneNumber!);
        if (user != null && !user.emailVerified) {
          var actionCodeSettings = ActionCodeSettings(
            url: 'https://www.example.com/?email=${user.email}',
            androidPackageName: 'com.example.auto_valley',
            androidInstallApp: true,
            androidMinimumVersion: '12',
            iOSBundleId: 'com.example.auto_valley',
            handleCodeInApp: false,
          );

          await user.sendEmailVerification(actionCodeSettings);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  var today = DateUtils.dateOnly(DateTime.now());

  TextEditingController _controllerStart = TextEditingController(text: DateTime.now().toString());

  TextEditingController _controllerEnd = TextEditingController(text: DateTime.now().toString());
  String ? start = DateTime.now().toString();
  String ? end;


  Future<void> _openWhatsApp() async{
    String whatsAppUrl = "";
    final String phone = "+919509074466";
    String description = "Hello";
    whatsAppUrl =
    'https://wa.me/$phone?text=${Uri.parse(description)}';
    await launchUrlString(whatsAppUrl,mode: LaunchMode.externalApplication);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Text('Do You Want To Exit ?'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  void initState() {
    super.initState();
    getCurrentUser(context);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        _showMyDialog();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6476fe),
          title: Padding(
            padding: const EdgeInsets.only(bottom:10,),
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(
                    'images/auto_vally_heading.png',
                    fit: BoxFit.fill,).image,
                ),
              ),
            ),
          ),
          actions: [

            GestureDetector(
              onTap: () {
               _openWhatsApp();
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('images/wp.png',).image,
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context)=>SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: DownScreen(),
                    ),
                  ));
            },
                icon: Icon(Icons.more_vert)),
          ],
        ),
        drawer: Drawer(
          child: MenuScreen(),
        ),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: MediaQuery.of(context).size.height/9.8,
                    width: MediaQuery.of(context).size.width/1.129,
                    child: FittedBox(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: CalendarPickerCard(
                                onsave:  (value){
                                  setState((){
                                    start = value!;
                                    Provider.of<Data>(context,listen: false).updateStartTime(start!);
                                  });
                                },
                                height: MediaQuery.of(context).size.height/15,
                                width: MediaQuery.of(context).size.width/2.7,
                                onPress: (){},
                                text: 'Start Trip',
                                textStyle: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff6476fe),
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: CalendarPickerCard(
                                onsave:  (value){
                                  setState((){
                                  end = value!;
                                   print(_controllerEnd.text);
                                    Provider.of<Data>(context,listen: false).updateEndTime(end!);
                                  });
                                },
                                height: MediaQuery.of(context).size.height/15,
                                width: MediaQuery.of(context).size.width/2.7,
                                onPress: () {},
                                text: 'End Trip',
                                textStyle: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff6476fe),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.126,
                    height: MediaQuery.of(context).size.height/1.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height/4.4,
                            child: MovingDisplayCards(
                              height: MediaQuery.of(context).size.height/4.7,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/45,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.126,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike1.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'KTM',
                                      user: '40 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike2.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'Yamaha',
                                      user: '50 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike3.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'Duke',
                                      user: '30 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike1.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'KTM',
                                      user: '40 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike2.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'Yamaha',
                                      user: '50 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike3.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'Duke',
                                      user: '30 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike1.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'KTM',
                                      user: '40 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike2.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'Yamaha',
                                      user: '50 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomListItem(
                                      thumbnail: Image.asset('images/bike3.jpg',
                                        fit: BoxFit.fill,),
                                      title: 'Duke',
                                      user: '30 km Allow',
                                      amount: 400),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/90,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
