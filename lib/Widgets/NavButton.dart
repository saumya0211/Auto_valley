import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  NavButton({
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
          BoxShadow(color: buttoncolor.withOpacity(0.55) , offset: Offset(0,0),spreadRadius: 7,blurRadius: 35),
        ],
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
