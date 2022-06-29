import 'package:auto_valley/models/Display_Card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovingDisplayCards extends StatelessWidget {
  final double height;
  MovingDisplayCards({
    required this.height,
});

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    if(_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeOut);
    }
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 1.1261,
      height: height,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: [

          DisplayCard(
              imgsource: 'images/bike1.jpg',
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/1.2),

          DisplayCard(
              imgsource: 'images/bike2.jpg',
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/1.2),

          DisplayCard(
              imgsource: 'images/bike3.jpg',
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/1.2),

          DisplayCard(
              imgsource: 'images/bike1.jpg',
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/1.2),

          DisplayCard(
              imgsource: 'images/bike2.jpg',
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/1.2),

          DisplayCard(
              imgsource: 'images/bike3.jpg',
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/1.2),

        ],
      ),
    );
  }
}