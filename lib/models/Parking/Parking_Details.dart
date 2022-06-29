import 'package:auto_valley/models/Parking/Parking_Details_Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ParkingDetailScreen extends StatelessWidget {
  final String address;
  ParkingDetailScreen({
    required this.address,
});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(width: MediaQuery.of(context).size.width/4.4,),
            Text('Parking Details',style: GoogleFonts.poppins(
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
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    elevation: 10,
                    child:Container(
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Center(child: Text('The Facility Parking',style: TextStyle(color: Color(0xff6476fe),fontSize: 20),)),
                    ) ,
                  ),
                  SizedBox(height: 20,),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    elevation: 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width/1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ParkingDetailsCard(
                                iconData: Icons.account_circle_outlined,
                                text: 'Admin Name',
                                value: 'Debashis B.'),


                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Container(
                                  height: MediaQuery.of(context).size.height/15,
                                  width: MediaQuery.of(context).size.width/1.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    border: Border.all(color: Color(0xff6475ff),width: 1),
                                  ),
                                  child:  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [

                                        Expanded(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/20,
                                            width: MediaQuery.of(context).size.width/2.5,
                                            child: ListTile(
                                              leading: Icon(Icons.local_parking,color: Color(0xff6475ff),),
                                              title: Center(
                                                child: FittedBox(
                                                  child: Text('Parking Address -' ,style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          constraints: BoxConstraints(
                                            maxHeight: MediaQuery.of(context).size.height/21.5,
                                            maxWidth:  MediaQuery.of(context).size.width/2.4,
                                          ),
                                          height: MediaQuery.of(context).size.height/22.5,
                                          width: MediaQuery.of(context).size.width/2.6,
                                          child: Center(
                                            child: Text('fvd ,' +address,style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w400,
                                            ),),
                                          ),
                                        ),
                                        SizedBox(width: 4,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ParkingDetailsCard(
                                iconData: Icons.location_on_outlined,
                                text: 'Distance',
                                value: '50km'),
                            ParkingDetailsCard(
                                iconData: Icons.oil_barrel_outlined,
                                text: 'Fuel Availability',
                                value: 'yes'),
                            ParkingDetailsCard(
                                iconData: Icons.nights_stay_outlined,
                                text: 'Night Stay',
                                value: 'no'),
                            ParkingDetailsCard(
                                iconData: Icons.fastfood_outlined,
                                text: 'Food Availability',
                                value: 'yes'),
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
