import 'package:auto_valley/models/User%20Data%20Models/User_BluePrint.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier{
  autoVallyUser _user = autoVallyUser();

  String _StartTime = DateTime.now().toString();
  String _EndTime = DateTime.now().toString();

  void updateStartTime(String value){
    _StartTime = value;
    notifyListeners();
  }

  String get startTime{
    return _StartTime;
  }

  void updateAadharCard(String? value){
    _user.aadharcard = value;
    notifyListeners();
  }

  String? get aadharCard{
    return _user.aadharcard;
  }


  void updateDrivingLicence(String? value){
    _user.drivinglicence = value;
    notifyListeners();
  }

  String? get drivinglicence{
    return _user.drivinglicence;
  }

  void updateSelfie(String? value){
    _user.selfie = value;
    notifyListeners();
  }

  String? get selfie{
    return _user.selfie;
  }

  void updateEndTime(String value){
    _EndTime = value;
    notifyListeners();
  }

  String get endTime{
    return _EndTime;
  }

  void updateName(String name){
    _user.name = name;
    notifyListeners();
  }

  void updateEmail(String email){
    _user.email = email;
    notifyListeners();
  }

  void updatePhone(String phone){
    _user.phonenumber = phone;
    notifyListeners();
  }

  void updateAddress(String address){
    _user.address = address;
    notifyListeners();
  }

  void updateProfileImg(String imgpath) async{
    _user.profileImgPath = imgpath;
    notifyListeners();
  }

  void updatePassword(String pass){
    _user.password= pass;
    notifyListeners();
  }

  // 0 -> female , 1 -> male
  void updateGender(int num){
    _user.gender = num;
    notifyListeners();
  }

  String get name{
    return _user.name;
  }

  String get email{
    return _user.email;
  }

  String get phonenumber{
    return _user.phonenumber;
  }

  String get address{
    return _user.address;
  }

  String get password{
    return _user.password;
  }

  String? get profileImgPath{
    return _user.profileImgPath;
  }

  // void AddProfileImg({
  //   required File pickedThumb,}){
  //
  //   updateProfileImg(pickedThumb);
  //   notifyListeners();
  //   dbHelper.insert('placestore',{
  //     'thumbnail' : pickedThumb.path,
  //   });
  // }

  // Future<void> fetchAndSetProfileImg() async{
  //   final data = await dbHelper.getData('placestore');
  //   _PlaceListHolder =  dataList.map((PlaceListHolder) => Place(
  //     location: PlaceLocation(
  //       latitude:  PlaceListHolder['lat'],
  //       longitude: PlaceListHolder['long'],
  //       address: PlaceListHolder['address'],
  //     ) ,
  //     Thumb: PlaceListHolder['thumbnail'],
  //     Vid: PlaceListHolder['video'],
  //     title: PlaceListHolder['title'],
  //     id: PlaceListHolder['id'],
  //   )).toList();
  //   notifyListeners();
  // }
}