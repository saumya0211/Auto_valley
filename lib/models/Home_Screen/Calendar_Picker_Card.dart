import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarPickerCard extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final TextStyle textStyle;
  final VoidCallback onPress;
  TextEditingController ? controller ;
  void Function(String ?)? onsave;

  CalendarPickerCard({
    required this.height,
    required this.width,
    required this.text,
    required this.textStyle,
    required this.onPress,
    this.controller,
    required this.onsave,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(text,style: textStyle,),
            ),
            SizedBox(height: 2,),
            FittedBox(
              child: Container(
                height: 30,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff6476fe),width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DateTimePicker(
                    initialValue: DateTime.now().toString(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/33,
                    ),
                    dateMask: 'd MMMM hh:mm a',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    type: DateTimePickerType.dateTime,
                    icon: Icon(Icons.calendar_today_rounded,color: Color(0xff6476fe),size: 15,),
                    onChanged: onsave,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
