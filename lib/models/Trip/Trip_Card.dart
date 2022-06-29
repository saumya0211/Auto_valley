import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/NavButtonv2.dart';
import 'package:auto_valley/models/Bike_Detail_Field_Card.dart';
import 'package:auto_valley/models/Trip/Complaint_Report_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TripCard extends StatefulWidget {
  final String bikeCompany;
  final String vehiclenum;
  final String cost;

  TripCard({
    required this.bikeCompany,
    required this.vehiclenum,
    required this.cost,
});


  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    String Tempreview = '';
    String review;

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('What is your rating ?')),
            content: Container(
              height:MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width/1.26,
              child: Column(
                children: [
                FittedBox(
                  child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
              ),
                ), 
                  SizedBox(height: 10,),
                  FittedBox(
                    child: Text('Please share your Experience about the\n'
                        'service and trip' ,textAlign: TextAlign.center,style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height/8.7,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color:(Color(0xff6476fe)),width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'Your Review',
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value){
                              setState((){
                                Tempreview = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve',style: TextStyle(color: Color(0xff6476fe)),),
                onPressed: () {
                  setState((){
                   review = Tempreview;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Your Review is Added Sucessfully'),
                     duration: Duration(seconds: 1 ,milliseconds: 400),));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    final dataProvider = Provider.of<Data>(context,listen: false);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height/2.4,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.fast_rewind,size: 30,color: Color(0xffc4cbff),),
                    Text('Auto',style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffc4cbff),
                    ),),
                  ],
                ),

                Container(
                  constraints: BoxConstraints(
                    minHeight: 5.0,
                    minWidth: 5.0,
                    maxHeight: 70,
                    maxWidth: 200,
                  ),

                  decoration: BoxDecoration(
                    color: Color(0xff6475ff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: FittedBox(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Booked Trip',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height/7,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Container(
                         height: MediaQuery.of(context).size.height/16,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(dataProvider.startTime),
                             Divider(
                               thickness: 2,
                               color:  Color(0xff6475ff),
                             ),
                           ],
                         ),
                       ),
                       Container(
                        height: MediaQuery.of(context).size.height/16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(dataProvider.endTime),
                            Divider(
                              thickness: 2,
                              color:  Color(0xff6475ff),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: BikeDetailFieldCard(
                      height: MediaQuery.of(context).size.height/20,
                      width: MediaQuery.of(context).size.width/1.5,
                      inputIcon: Icon(Icons.pedal_bike,color: Color(0xff6676f5),),
                      inputText: Text('Vehicle Number',style: TextStyle(

                      ),)),
                ),

                SizedBox(width: MediaQuery.of(context).size.height/50,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(widget.vehiclenum,style: TextStyle(
                       color: Colors.red,
                       fontSize: 20,
                       fontWeight: FontWeight.w500,
                  ),),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              width: MediaQuery.of(context).size.width/1.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minHeight: 5.0,
                            minWidth: 5.0,
                            maxHeight: 70,
                            maxWidth: 200,
                          ),

                          decoration: BoxDecoration(
                           border: Border.all(color:  Color(0xff6476fe),width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: FittedBox(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.bikeCompany),
                          )),
                        ),
                        SizedBox(width: 10,),
                        Text('Model : ' + widget.vehiclenum),

                      ],
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width/15,),
                  Align(
                    alignment: Alignment.topRight,
                    child: NavButton(
                      buttoncolor: Color(0xff6575ff),
                      ButtonVoidCallBack: (){
                        _showMyDialog();
                      },
                      buttonChild: FittedBox(
                        child: Text('Add Review',style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                      Height:MediaQuery.of(context).size.height/25,
                      Width:  MediaQuery.of(context).size.width/4.5,),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavButtonv2(
                  boxBorder: Border.all(color:  Color(0xff6476fe),width: 1),
                  buttoncolor: Colors.white,
                  ButtonVoidCallBack: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintReportPage()));
                  },
                  buttonChild: FittedBox(
                    child: Text('Add Complaint',style: TextStyle(
                      color: Color(0xff6476fe),
                    ),),
                  ),
                  Height: MediaQuery.of(context).size.height/22,
                  Width: MediaQuery.of(context).size.width/4.2, ),


                SizedBox(width: MediaQuery.of(context).size.width/6,),
                Row(
                  children: [
                    CircleAvatar(child: Text('\u{20B9}' ,
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),),
                      backgroundColor: Color(0xff6476fe),
                      radius: 15,),
                    SizedBox(width: 5,),
                    Text(widget.cost,style: TextStyle(
                      fontSize: 18,
                    ),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
