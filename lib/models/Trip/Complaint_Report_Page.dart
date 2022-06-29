import 'package:auto_valley/models/Parking/Parking_Details_Picker_Card.dart';
import 'package:auto_valley/models/Trip/ComplaintCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintReportPage extends StatelessWidget {

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
            SizedBox(width: MediaQuery.of(context).size.width/6,),
            Text('Reports',style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width/1.1267,
              ),
              height: MediaQuery.of(context).size.height/2.2,
              width: MediaQuery.of(context).size.width/1.127,
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width/1.27,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/45,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 50,
                          width: MediaQuery.of(context).size.width/2,
                          child: ListTile(
                            leading: Icon(Icons.add_comment_outlined,color: Color(0xff6476fe),size: 30,),
                            title: Text('Complaint' ,style: TextStyle(
                                color: Color(0xff6476fe),
                                fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.127,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                           ComplaintCard(
                               height: MediaQuery.of(context).size.height/40,
                               complaintType: 'I lost an item'),
                            ComplaintCard(
                                height: MediaQuery.of(context).size.height/40,
                                complaintType: 'Tire Punctured'),
                            ComplaintCard(
                                height: MediaQuery.of(context).size.height/40,
                                complaintType: 'Rent prices were high'),
                            ComplaintCard(
                                height: MediaQuery.of(context).size.height/40,
                                complaintType: 'Vehicle services is not up to the mark'),
                            ComplaintCard(
                                height: MediaQuery.of(context).size.height/40,
                                complaintType: 'Other'),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
