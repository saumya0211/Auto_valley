import 'package:flutter/material.dart';

class PickedColorCircle extends StatelessWidget {
  Color color;
  VoidCallback onTap;

  PickedColorCircle({
    required this.color,
    required this.onTap,
});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20,
      ),
    );
  }
}
