import 'package:flutter/material.dart';

class FormModel {
  String name;
  String phoneNumber;
  String address;
  String email;
  String password;

  FormModel({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.email,
    required this.password});
}