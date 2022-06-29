import 'package:auto_valley/models/Bike_Detail_Field_Card.dart';
import 'package:flutter/material.dart';

class ParkingDetailsCard extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String value;

  ParkingDetailsCard({
    required this.iconData,
    required this.text,
    required this.value,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
            flex: 3,
            child: BikeDetailFieldCard(
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/1.5,
                inputIcon: Icon(iconData,color: Color(0xff6676f5),),
                inputText: Text(text,style: TextStyle(
                  fontSize: 16,
                ),)),
          ),

          Expanded(
            child: Text(value,style: TextStyle(

            ),),
          ),
        ],
      ),
    );
  }
}
