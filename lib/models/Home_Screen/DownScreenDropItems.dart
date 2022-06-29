import 'package:flutter/material.dart';

class DropDownItem extends StatelessWidget {
  final String text;

  DropDownItem({
    required this.text
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5,bottom: 5),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 5.0,
          minWidth: 5.0,
          maxHeight: 70,
          maxWidth: 200,
        ),
      
        decoration: BoxDecoration(
          color: Color(0xffe3e3e3),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: FittedBox(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        )),
      ),
    );
  }
}
