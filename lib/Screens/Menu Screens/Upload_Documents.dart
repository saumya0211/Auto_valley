import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/NavButtonv2.dart';
import 'package:auto_valley/models/Upload_Doc_Card.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

List<String> Documents = ['Aadhar Card','Driving Licence','Selfie'];

class DocUploadScreen extends StatelessWidget {

  Future<void> _showMyAadhar(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Aadhar Card'),
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height/10,
              width: MediaQuery.of(context).size.width/1.267,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Provider.of<Data>(context).aadharCard!=null ? Image.network( Provider.of<Data>(context).aadharCard!,fit: BoxFit.fill,).image :
                  Image.asset('images/profileAvatar.png',fit: BoxFit.fill,).image,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _showMyDrivingLicence(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Driving Licence'),
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height/10,
              width: MediaQuery.of(context).size.width/1.267,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Provider.of<Data>(context).drivinglicence!=null ? Image.network( Provider.of<Data>(context).drivinglicence!,fit: BoxFit.fill,).image :
                  Image.asset('images/profileAvatar.png',fit: BoxFit.fill,).image,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _showMySelfie(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Selfie'),
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height/10,
              width: MediaQuery.of(context).size.width/1.267,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Provider.of<Data>(context).selfie!=null ? Image.network( Provider.of<Data>(context).selfie!,fit: BoxFit.fill,).image :
                  Image.asset('images/profileAvatar.png',fit: BoxFit.fill,).image,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataPicker = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Color(0xff6476fe),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width/5.4,),
            Text('Upload Documents',style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/1.126,
          child: ListView(
            children: [
              // TODO: Don't Change docName , if you do please change in everyplace you find
              UploadDocCard(docName: 'Aadhar Card', icondata: Icons.upload_file,onPressPreview: (){_showMyAadhar(context);},),
              UploadDocCard(docName: 'Driving Licence', icondata: Icons.upload_file,onPressPreview: (){_showMyDrivingLicence(context);},),
              UploadDocCard(docName: 'Selfie', icondata: Icons.photo_camera_back,onPressPreview: (){_showMySelfie(context);},),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: NavButton(
                        buttoncolor: Color(0xff6476fe),
                        ButtonVoidCallBack: (){

                        },
                        buttonChild: FittedBox(
                          child: Text('Save Documents',style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Height: 50,
                        Width: MediaQuery.of(context).size.width/3,),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child:NavButtonv2(
                        boxBorder: Border.all(color:  Color(0xff6476fe),width: 1),
                        buttoncolor: Colors.white,
                        ButtonVoidCallBack: () async{
                             final _storage = FirebaseStorage.instance;

                             if(dataPicker.aadharCard!=null) {
                               try {
                                 await _storage.refFromURL(
                                     dataPicker.aadharCard!)
                                     .delete();
                               }on FirebaseException catch(e){
                                 print(e.code);
                               }catch(e){
                                 print(e);
                               }
                             }
                             if(dataPicker.drivinglicence!=null) {
                               try {
                                 await _storage.refFromURL(
                                     dataPicker.drivinglicence!)
                                     .delete();
                               }on FirebaseException catch(e){
                                 print(e.code);
                               }catch(e){
                                 print(e);
                               }
                             }
                             if(dataPicker.selfie!=null) {
                               try {
                                 await _storage.refFromURL(dataPicker.selfie!)
                                     .delete();
                               }on FirebaseException catch(e){
                                 print(e.code);
                               }catch(e){
                                 print(e);
                               }
                             }

                             dataPicker.updateAadharCard(null);
                             dataPicker.updateDrivingLicence(null);
                             dataPicker.updateSelfie(null);

                             ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                               duration: Duration(seconds: 2),
                               margin: EdgeInsets.all(40),
                               backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
                               behavior: SnackBarBehavior.floating,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                               content: Text('All Documents Deleted',style: TextStyle(
                                 color: Colors.black54,
                                 fontSize: 16,
                                 fontWeight: FontWeight.w300,
                               ),
                                 textAlign: TextAlign.center,),
                             ));
                        },
                        buttonChild: FittedBox(
                          child: Text('Remove Documents',style: TextStyle(
                            color: Color(0xff6476fe),
                          ),),
                        ),
                        Height: 50,
                        Width: MediaQuery.of(context).size.width/3, ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
