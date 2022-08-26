import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlinks extends StatelessWidget {
  final String text;
  final double fontsize;

  Hyperlinks({
    required this.text,
    required this.fontsize,
});


  @override
  Widget build(BuildContext context) {
    return  RichText(text: TextSpan(text: text,style:TextStyle(
      fontSize: fontsize,
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ), recognizer: TapGestureRecognizer()..onTap= (){
      launchUrl(Uri.parse('http://autovally.in/'),mode: LaunchMode.externalApplication);
    }),);
  }
}
