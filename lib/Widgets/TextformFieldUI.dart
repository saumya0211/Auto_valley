import 'package:flutter/material.dart';

class TextFormFieldUI extends StatelessWidget {
 final String hintText;
 final Icon inputicon;
 final TextStyle hintTextStyle;
 bool  isPassword ;
 bool  isEmail ;
 final String ? Function(String?)? validatefunction ;
 final void Function(String?)? onSave;
 String ? initialValue;

 TextFormFieldUI({
   required this.inputicon,
   required this.hintText,
   required this.hintTextStyle,
   required this.validatefunction,
   required this.onSave,
   this.isPassword = false,
   this.isEmail = false,
   this.initialValue ,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.2,
      height: MediaQuery.of(context).size.height/13,
      child: TextFormField(
        initialValue: initialValue,
        onSaved: onSave,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: validatefunction,
        obscureText: isPassword ? true : false ,
        decoration: InputDecoration(
          floatingLabelStyle: hintTextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          label: Text(hintText,style: hintTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),),
          prefixIcon: inputicon,
          // hintText: hintText,
          // hintStyle: hintTextStyle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6476fe),width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6476fe),width: 3),
          ),
        ),
      ),
    );
  }
}
