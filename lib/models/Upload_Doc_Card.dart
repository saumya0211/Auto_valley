import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Menu%20Screens/Upload_Documents.dart';
import 'package:auto_valley/models/Taking_Picture/Take_Pic_Down_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadDocCard extends StatefulWidget {
  final String docName;
  final IconData icondata;
  bool ? isSubmitted;
  final VoidCallback onPressPreview;

  UploadDocCard({
    required this.docName,
    required this.icondata,
    required this.onPressPreview,
    this.isSubmitted ,
});

  @override
  State<UploadDocCard> createState() => _UploadDocCardState();
}

class _UploadDocCardState extends State<UploadDocCard> {

  void isSubmitSetter(){
    if(widget.docName == 'Aadhar Card'){
      if(Provider.of<Data>(context).aadharCard!=null){
        setState((){
          widget.isSubmitted = true;
        });
      }
    }else if(widget.docName == 'Driving Licence'){
      if(Provider.of<Data>(context).drivinglicence!=null) {
        setState(() {
          widget.isSubmitted = true;
        });
       }
      }else if(widget.docName == 'Selfie'){
        if(Provider.of<Data>(context).selfie!=null){
          setState((){
            widget.isSubmitted = true;
          });
      }
    }else{
        setState((){
          widget.isSubmitted = false;
        });
      }

  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    isSubmitSetter();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        elevation: 10,
        child: Container(
          height: MediaQuery.of(context).size.height/7,
          width: MediaQuery.of(context).size.width/1.126,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(
                  child: IconButton(
                    icon: Icon(widget.icondata,color: Color(0xff6476fe),size: 50,),
                    onPressed:()async{
                      // docSet(context);
                      final imgval = await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context)=>SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: TakePicDownScreen(docname: widget.docName,),
                            ),
                          ));

                      if(imgval!= null){
                        setState((){
                          widget.isSubmitted = true;
                          print(widget.isSubmitted);
                        });
                      }

                    },)),
              SizedBox(width: MediaQuery.of(context).size.width/10,),
              Expanded(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.docName,style: TextStyle(
                        fontSize: 16,
                      ),),
                      Row(
                        children: [
                          Text('Status :',style: TextStyle(color:Color(0xff6476fe) ),),
                          SizedBox(width: 5,),
                          widget.isSubmitted !=true ? Text('Not Uploaded',style: TextStyle(
                            color: Colors.red,
                          ),) :Text('Uploaded',style: TextStyle(
                            color: Colors.green,
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(onPressed: widget.onPressPreview, child: Text('Preview')),
              SizedBox(width: MediaQuery.of(context).size.width/20,),
            ],
          ),
        ),
      ),
    );
  }
}
