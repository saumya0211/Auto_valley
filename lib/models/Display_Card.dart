import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String imgsource;
  final double height;
  final double width;

  DisplayCard({
    required this.imgsource,
    required this.height,
    required this.width,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Material(
        shadowColor: Colors.black,
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(imgsource).image,
            ),
          ),
        ),
      ),
    );
  }
}
