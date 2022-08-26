import 'package:auto_valley/Helper_Function/Home_Screen.dart';
import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Down_Screen.dart';
import 'package:auto_valley/Screens/Home_Screen/Menu_Screen.dart';
import 'package:auto_valley/models/Home_Screen/Bike_reach_amount_Card.dart';
import 'package:auto_valley/models/Home_Screen/Calendar_Picker_Card.dart';
import 'package:auto_valley/Widgets/Moving_Display_Cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var today = DateUtils.dateOnly(DateTime.now());

  String ? start = DateTime.now().toString();
  String ? end;


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        appExitDialog(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6476fe),
          title: Padding(
            padding: const EdgeInsets.only(bottom:10,),
            child: GestureDetector(
              onTap: (){
                launchUrl(Uri.parse('http://autovally.in/'),mode: LaunchMode.externalApplication);
              },
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
          ),
          actions: [

            GestureDetector(
              onTap: () {
               openWhatsApp();
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
                            height: MediaQuery.of(context).size.height/1.7,
                            child: ListView(
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
