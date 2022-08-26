import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          androidPackageName: 'com.autovally.auto_vally.auto_valley',
          androidInstallApp: true,
          androidMinimumVersion: '12',
          iOSBundleId: 'com.autovally.auto_vally.auto_valley',
          handleCodeInApp: false,
        );

        await user.sendEmailVerification(actionCodeSettings);
      }
    }
  } catch (e) {
    print(e);
  }
}

Future<void> openWhatsApp() async{
  String whatsAppUrl = "";
  final String phone = "+919509074466";
  String description = "Hello";
  whatsAppUrl =
  'https://wa.me/$phone?text=${Uri.parse(description)}';
  await launchUrlString(whatsAppUrl,mode: LaunchMode.externalApplication);
}

Future<void> appExitDialog(BuildContext context) async {
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
