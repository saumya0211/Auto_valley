//
// import 'package:flutter/material.dart';
//
// class SnackBarUI extends StatelessWidget {
//   const SnackBarUI({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//       duration: Duration(seconds: 2),
//       margin: EdgeInsets.all(40),
//       backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//       content: Text('No user found for that email',style: TextStyle(
//         color: Colors.black54,
//         fontSize: 16,
//         fontWeight: FontWeight.w300,
//       ),
//         textAlign: TextAlign.center,),
//     ));
//   }
// }
