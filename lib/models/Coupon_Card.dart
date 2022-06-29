import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String discount;
  final String couponcode;
  final String desc;
  final String daysLeft;
  final String expdate;

  CouponCard({
    required this.discount,
    required this.couponcode,
    required this.desc,
    required this.daysLeft,
    required this.expdate,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: MediaQuery.of(context).size.height/8,
          width: MediaQuery.of(context).size.width/1.1267,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white60,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                  child:Container(
                    decoration: BoxDecoration(
                        color: Color(0xff6476fe),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    ),
                    height: MediaQuery.of(context).size.height/8,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(discount,style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),),
                          Text('off',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                    ),
                  ) ),

              Expanded(
                 flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: Container(
                              height: MediaQuery.of(context).size.height/8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(desc,style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),),
                                  Text(couponcode,style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6476fe),
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Container(
                              height: MediaQuery.of(context).size.height/8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xff6476fe),
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Center(child: Text(daysLeft+' left',style: TextStyle(
                                      color: Colors.white,
                                    ),)),
                                  ),
                                  SizedBox(height: 5,),
                                  FittedBox(
                                    child: Text('Expiry : ' + expdate ,style: TextStyle(
                                      color: Colors.red,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ], 
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
