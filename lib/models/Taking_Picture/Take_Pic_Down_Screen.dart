import 'dart:io';

import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/models/Taking_Picture/Picture%20model.dart';
import 'package:auto_valley/models/Taking_Picture/Utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:auto_valley/Providers/db_helper.dart';
import 'package:provider/provider.dart';

class TakePicDownScreen extends StatefulWidget {
  final String docname;

  TakePicDownScreen({
    required this.docname,
});
  @override
  State<TakePicDownScreen> createState() => _TakePicDownScreenState();
}

class _TakePicDownScreenState extends State<TakePicDownScreen> {
  User ? loggedinUser;
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
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

  void initState() {
    super.initState();
    getCurrentUser();
  }

  File ? _CapturedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final dataPicker = Provider.of<Data>(context,listen: false);

     Future<String?> _takePicGallery() async{
      String ? imgpath;
      final NewImage = await _picker.pickImage(source: ImageSource.gallery,
       imageQuality: 60,
       maxWidth: 200);
      final NewImageFile = File(NewImage!.path);
      setState(() {
        _CapturedImage = NewImageFile;
      });

      final ref =FirebaseStorage.instance.ref().child('user_images').child('${loggedinUser!.email}/${widget.docname}');
      if(_CapturedImage!=null){
       await ref.putFile(_CapturedImage!).whenComplete(() => {});
       imgpath = await  ref.getDownloadURL();

       if(widget.docname == 'Aadhar Card'){
         dataPicker.updateAadharCard(imgpath);
       }else if(widget.docname == 'Driving Licence'){
         dataPicker.updateDrivingLicence(imgpath);
       }else if(widget.docname == 'Selfie'){
         dataPicker.updateSelfie(imgpath);
       }
      }
     return imgpath;
    }

    Future<String?> _takePicfromCamera() async{
      String ? imgpath;
      final NewImage = await _picker.pickImage(source: ImageSource.camera,
       imageQuality: 60,
        maxWidth: 200);
      final NewImageFile = File(NewImage!.path);
      setState(() {
        _CapturedImage = NewImageFile;
      });
      final ref =FirebaseStorage.instance.ref().child('user_images').child('${loggedinUser!.email}/${widget.docname}');
      if(_CapturedImage!=null){
        await ref.putFile(_CapturedImage!).whenComplete(() => {});
        imgpath = await  ref.getDownloadURL();
      }
      return imgpath;
    }

    return Container(
      height: MediaQuery.of(context).size.height/5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Upload Documents',style: TextStyle(
            fontSize: 22,
          ),),
         SizedBox(height: 10,),
         Container(
           width: MediaQuery.of(context).size.width/1.2,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               GestureDetector(
                 onTap: () async{
                   final imgpath = await _takePicfromCamera();
                   Navigator.pop(context,imgpath!);
                 },
                 child: Container(
                   height: MediaQuery.of(context).size.height/15,
                   width: MediaQuery.of(context).size.width,
                   child: ListTile(
                     leading: Icon(Icons.camera_alt_outlined,color: Color(0xff6476fe),size: 30,),
                     title: Text('Take a photo',style: TextStyle(
                       fontSize: 14,
                     ),),
                   ),
                 ),
               ),

               GestureDetector(
                 onTap: () async{
                   final imgpath = await _takePicGallery();
                   print(imgpath);
                   Navigator.pop(context,imgpath);
                 },
                 child: Container(
                   height: MediaQuery.of(context).size.height/15,
                   width: MediaQuery.of(context).size.width,
                   child: ListTile(
                     leading: Icon(Icons.photo_library_outlined,color: Color(0xff6476fe),size: 30),
                     title: Text('Upload from gallery',style: TextStyle(
                       fontSize: 14,
                     ),),
                   ),
                 ),
               ),
             ],
           ),
         ),

        ],
      ),
    );
  }
}
