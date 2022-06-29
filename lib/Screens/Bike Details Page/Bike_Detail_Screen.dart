import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Providers/Location_provider.dart';
import 'package:auto_valley/Screens/Confirmation_Page.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/models/Bike_Detail_Field_Card.dart';
import 'package:auto_valley/models/Display_Card.dart';
import 'package:flutter/material.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BikeDetailScreen extends StatefulWidget {

  @override
  State<BikeDetailScreen> createState() => _BikeDetailScreenState();
}

class _BikeDetailScreenState extends State<BikeDetailScreen> {
  late String PinCode = '';
  late String  AddressShown = '';

  late TabController tabController;

  void getAddress()async{
    Placemark Address = await getLocation();
    String place = await Address.subLocality!;
    String postalcode = await Address.postalCode!;
    setState((){
      AddressShown = place;
      PinCode = postalcode;
      print(AddressShown);
    });
  }

  @override
  void initState() {
    super.initState();
    getAddress();
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
            SizedBox(width: MediaQuery.of(context).size.width/4,),
            Text('Auto Vally',style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/45,),
                  DisplayCard(
                      imgsource: 'images/bike1.jpg',
                      height: MediaQuery.of(context).size.height/4.5,
                      width: MediaQuery.of(context).size.width/1.1),
                  Card(
                    elevation: 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height/2.3,
                        width: MediaQuery.of(context).size.width/1.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: BikeDetailFieldCard(
                                      height: MediaQuery.of(context).size.height/20,
                                      width: MediaQuery.of(context).size.width/2,
                                      inputIcon: Icon(Icons.bike_scooter_outlined,color: Color(0xff6676f5),),
                                      inputText: Text('abhi',style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),)),
                                ),

                                SizedBox(width: MediaQuery.of(context).size.width/50,),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/25,
                                    width: MediaQuery.of(context).size.width/3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: Color(0xff6475ff),width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Zip Code:' ,style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),),
                                          Text(PinCode),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: BikeDetailFieldCard(
                                      height: MediaQuery.of(context).size.height/20,
                                      width: MediaQuery.of(context).size.width/2,
                                      inputIcon: Icon(Icons.phone,color: Color(0xff6676f5),),
                                      inputText: FittedBox(
                                        child: Text('+91 7428040855',style: TextStyle(

                                        ),),
                                      )),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/8.5,),
                               Align(
                                 alignment: Alignment.topRight,
                                 child: NavButton(
                                     buttoncolor: Color(0xff6575ff),
                                     ButtonVoidCallBack: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmationScreen(
                                        address: AddressShown,
                                        pincode: PinCode,)));
                                     },
                                     buttonChild: FittedBox(
                                       child: Text('Book Now',style: GoogleFonts.openSans(
                                         color: Colors.white,
                                         fontSize: 14,
                                         fontWeight: FontWeight.w600,
                                       ),),
                                     ),
                                     Height:MediaQuery.of(context).size.height/25,
                                     Width:  MediaQuery.of(context).size.width/4.5,),
                               )
                              ],
                            ),
                            BikeDetailFieldCard(
                                height: MediaQuery.of(context).size.height/20,
                                width: MediaQuery.of(context).size.width/1.2,
                                inputIcon: Icon(Icons.email_rounded,color: Color(0xff6676f5),),
                                inputText: Text('dev16sindh@gmail.com',style: TextStyle(

                                ),)),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(color: Color(0xff6475ff),width: 1),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width/1.1,
                                  maxHeight: MediaQuery.of(context).size.height/18,
                                ),
                                width: MediaQuery.of(context).size.width/1.24,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FittedBox(child: Icon(Icons.access_time,color: Color(0xff6475ff),)),

                                      FittedBox(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Station Timing -' ,style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),),
                                              Text(dataPicker.startTime + ' - ' + dataPicker.endTime,style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w400,
                                              ),),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                BikeDetailFieldCard(
                                    height: MediaQuery.of(context).size.height/20,
                                    width: MediaQuery.of(context).size.width/2,
                                    inputIcon: Icon(Icons.color_lens,color: Color(0xff6676f5),),
                                    inputText: Text('Color Variants',style: TextStyle(

                                    ),)),
                                SizedBox(width: MediaQuery.of(context).size.width/20,),
                                Container(
                                  height: MediaQuery.of(context).size.height/20,
                                  width: MediaQuery.of(context).size.width/4,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                      height: MediaQuery.of(context).size.height/35,
                                      width:  MediaQuery.of(context).size.width/20,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(color: Colors.grey,width: 2),
                                      ),
                                    ),
                                      SizedBox(width: 2,),
                                      Container(
                                        height: MediaQuery.of(context).size.height/35,
                                        width:  MediaQuery.of(context).size.width/20,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          border: Border.all(color: Colors.grey,width: 2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: getAddress,
                              child: BikeDetailFieldCard(
                                  height: MediaQuery.of(context).size.height/20,
                                  width: MediaQuery.of(context).size.width/1.2,
                                  inputIcon: Icon(Icons.location_on,color: Color(0xff6676f5),),
                                  inputText: Text(AddressShown,style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff9d9d9d),
                                  ),)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BikeDetailFieldCard(
                                    height: MediaQuery.of(context).size.height/20,
                                    width: MediaQuery.of(context).size.width/2,
                                    inputIcon: Icon(Icons.maps_ugc,color: Color(0xff6676f5),),
                                    inputText: Text('View Location',style: TextStyle(

                                    ),)),

                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.keyboard_arrow_down)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
