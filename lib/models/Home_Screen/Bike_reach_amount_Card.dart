import 'package:auto_valley/Screens/Bike%20Details%20Page/Bike_Detail_Screen.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.amount,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String user;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BikeDetailScreen())),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            height: MediaQuery.of(context).size.height/6.8,
            width: MediaQuery.of(context).size.width/1.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Card(
                      elevation: 5,
                        child: thumbnail),
                  ),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: _VideoDescription(
                        title: title,
                        user: user,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Color(0xff6476fd),
                        ),
                        child: FittedBox(
                          child: Center(child:
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(amount.toString()+'/-Rs', style: TextStyle(
                              color: Colors.white,
                            ),),
                          )),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.title,
    required this.user,
  }) : super(key: key);

  final String title;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(
          user,
          style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xff6e78ea),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
      ],
    );
  }
}
