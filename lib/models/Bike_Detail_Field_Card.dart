import 'package:flutter/material.dart';

class BikeDetailFieldCard extends StatelessWidget {
  final double height;
  final double width;
  final Icon inputIcon;
  final Widget inputText;

  BikeDetailFieldCard({
    required this.height,
    required this.width,
    required this.inputIcon,
    required this.inputText,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: height,
        width: width,
        child: ListTile(
          leading: inputIcon,
          title: inputText,
        ),
      ),
    );
  }
}
