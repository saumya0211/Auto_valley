import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


Future<Placemark> getLocation() async
{
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {

    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await
  Geolocator.getCurrentPosition(desiredAccuracy:
  LocationAccuracy.high);
  debugPrint('location: ${position.latitude}');
  List<Placemark> addresses = await
  placemarkFromCoordinates(position.latitude,position.longitude);

  var first = addresses.first;
  return first;
}