import 'package:auto_valley/Screens/Bike%20Details%20Page/1st_Page_Confirmation.dart';
import 'package:auto_valley/Screens/Bike%20Details%20Page/2nd_Page_Confirmation.dart';
import 'package:auto_valley/Widgets/Moving_Display_Cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationScreen extends StatefulWidget {
  final String address;
  final String pincode;

  ConfirmationScreen({
    required this.address,
    required this.pincode,
});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> with TickerProviderStateMixin {
  late String PinCode = widget.pincode;

  late String Address = widget.address;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

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
            SizedBox(width: MediaQuery.of(context).size.width/4,),
            Text('Bike Details',style: GoogleFonts.poppins(
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
        child: SingleChildScrollView(
          child: Align( 
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('KTM',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black87,
                    ),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/60,),
                  MovingDisplayCards(height: MediaQuery.of(context).size.height/4.5,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/1.4,
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                            tabs:[
                              Tab(child: Text('Book Bike' ,style: TextStyle(color: Colors.black ,fontSize: 18),),),
                              Tab(child: Text('Description' ,style: TextStyle(color: Colors.black,fontSize: 18),),),
                            ] ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/1.6,
                          child: TabBarView(
                              controller: tabController,
                              children: <Widget>[
                              SingleChildScrollView(
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height/1.6,
                                    child: FirstPage(
                                      addresss: Address,
                                      pincode: PinCode,)),
                              ),
                            SecondPage(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
