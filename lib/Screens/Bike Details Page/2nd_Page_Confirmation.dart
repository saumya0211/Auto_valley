import 'package:auto_valley/models/Bike_Detail_Field_Card.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  String PinCode = '110018';
  String Address = 'WZ-134, Tilak Nagar, New Delhi ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/45,),
                    Card(
                      elevation: 20,
                      child: Container(
                        height: MediaQuery.of(context).size.height/2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: BikeDetailFieldCard(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/1.5,
                                        inputIcon: Icon(Icons.branding_watermark,color: Color(0xff6676f5),),
                                        inputText: Text('Brand',style: TextStyle(
                                                fontSize: 18,
                                        ),)),
                                  ),

                                  SizedBox(width: MediaQuery.of(context).size.width/15,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('KTM',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4,),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/22,
                                    width: MediaQuery.of(context).size.width/1.16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: Color(0xff6475ff),width: 1),
                                    ),
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Registration No.-',style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),),
                                        Text('5448',style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4,),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: MediaQuery.of(context).size.height/22,
                                  width: MediaQuery.of(context).size.width/1.16,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            color: Color(0xff6476fe),
                                          ),
                                          child: Center(child: Text('Mileage - 45 Km',style: TextStyle(
                                            color: Colors.white,
                                          ),)),
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Expanded(
                                        child: Container( 
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            color: Colors.white,
                                            border: Border.all(color: Color(0xff6476fe),width: 1 ),
                                          ),
                                          child: Center(child: Text('Model - 5448')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 4,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: BikeDetailFieldCard(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/1.5,
                                        inputIcon: Icon(Icons.oil_barrel,color: Color(0xff6676f5),),
                                        inputText: Text('TYPE',style: TextStyle(
                                          fontSize: 18,
                                        ),)),
                                  ),

                                  SizedBox(width: MediaQuery.of(context).size.width/15,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('Electric',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: BikeDetailFieldCard(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/1.5,
                                        inputIcon: Icon(Icons.pedal_bike,color: Color(0xff6676f5),),
                                        inputText: Text('No. of Km Completed',style: TextStyle(

                                        ),)),
                                  ),

                                  SizedBox(width: MediaQuery.of(context).size.width/15,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('400 Km',style: TextStyle(

                                    ),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: BikeDetailFieldCard(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/1.5,
                                        inputIcon: Icon(Icons.directions_bike_sharp,color: Color(0xff6676f5),),
                                        inputText: Text('No. of Rides Completed',style: TextStyle(

                                        ),)),
                                  ),

                                  SizedBox(width: MediaQuery.of(context).size.width/15,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('4',style: TextStyle(

                                    ),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            )),
      ),
    );
  }
}
