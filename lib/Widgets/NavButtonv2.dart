import 'package:flutter/material.dart';

class NavButtonv2 extends StatelessWidget {
  NavButtonv2({
    required this.buttoncolor,
    required this.ButtonVoidCallBack,
    required this.buttonChild,
    required this.Height,
    required this.Width,
    this.boxBorder ,
  });

  final Color buttoncolor;
  final Widget buttonChild;
  final VoidCallback ButtonVoidCallBack;
  final double Height;
  final double Width;
  BoxBorder ? boxBorder ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: buttoncolor.withOpacity(0.5) , offset: Offset(0,0),spreadRadius: 10,blurRadius: 20),
        ],
        border: boxBorder,
        borderRadius: BorderRadius.circular(6.0),
        color: buttoncolor,
      ),
      child: TextButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(buttoncolor),
        ),
        onPressed: ButtonVoidCallBack,
        child: Center(child: buttonChild,),
      ),
    );
  }
}
