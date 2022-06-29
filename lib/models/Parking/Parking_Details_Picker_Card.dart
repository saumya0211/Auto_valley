import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/NavButtonv2.dart';
import 'package:auto_valley/models/Parking/Parking_Details.dart';
import 'package:flutter/material.dart';

class ParkingDetailsPickerCard extends StatelessWidget {
 final String text;
 ParkingDetailsPickerCard({
   required this.text,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        elevation: 10,
        child: Container(
          height: MediaQuery.of(context).size.height/6.5,
          width: MediaQuery.of(context).size.width/1.126,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height/20,
                  width: MediaQuery.of(context).size.width/1.11,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/22,
                        width: MediaQuery.of(context).size.width/1.6,
                        child: ListTile(
                          leading: Image.asset('images/parking_logo.png',height: 40,width: 40,),
                          title: Text(text,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),),
                        ),
                      ),
                      Icon(Icons.directions_bike_outlined,color: Color(0xff7e7e7e),),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: NavButtonv2(
                  boxBorder: Border.all(color:  Color(0xff6476fe),width: 1),
                  buttoncolor: Colors.white,
                  ButtonVoidCallBack: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ParkingDetailScreen(address: text)));
                  },
                  buttonChild: FittedBox(
                    child: Text('View Details',style: TextStyle(
                      color: Color(0xff6476fe),
                    ),),
                  ),
                  Height: MediaQuery.of(context).size.height/28,
                  Width: MediaQuery.of(context).size.width/5, ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
            ],
          ),
        ),
      ),
    );
  }
}
