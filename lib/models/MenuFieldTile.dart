import 'package:flutter/material.dart';

class MenuFieldTile extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;

  MenuFieldTile({
    required this.icon,
    required this.title,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/15,
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon,size: 25,color: Color(0xff6476fe),),
          title: Text(title,style: TextStyle(fontSize: 13),),
        ),
      ),
    );
  }
}
