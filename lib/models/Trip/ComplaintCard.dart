import 'package:flutter/material.dart';

class ComplaintCard extends StatefulWidget {
 final double height;
 final String complaintType;

 ComplaintCard({
   required this.height,
   required this.complaintType,
});

  @override
  State<ComplaintCard> createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
 late String ComplaintText;

  @override
  Widget build(BuildContext context) {
    String tempComplaint = '';

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 300,
              width: MediaQuery.of(context).size.width/1.127,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.27,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Enter a description',style: TextStyle(
                      color:Color(0xff6476fe),
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    height: MediaQuery.of(context).size.height/5.5,
                    width: MediaQuery.of(context).size.width/1.127,
                    decoration: BoxDecoration(
                      border: Border.all(color:Color(0xff6476fe),width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'Description of Complaint',
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value){
                              setState((){
                                tempComplaint = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Add Complaint',style: TextStyle(color: Color(0xff6476fe)),),
                onPressed: () {
                  setState((){
                   ComplaintText = tempComplaint;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Your Complaint has been Registered'),
                    duration: Duration(seconds: 1 ,milliseconds: 400),));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return GestureDetector(
      onTap: (){
        _showMyDialog();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15,top: 15),
        child: Container(
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.complaintType,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
              Icon(Icons.arrow_forward_ios,color: Color(0xff6476fe),size: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
