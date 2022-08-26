import 'dart:convert';
import 'dart:io';
import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/TextformFieldUI.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateway extends StatefulWidget {


  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  Razorpay _razorpay = Razorpay();
  late String _amount = '';

  final _formkey = GlobalKey<FormState>();

  void _trySubmit(){
    final isValid = _formkey.currentState!.validate();

    if(isValid){
      _formkey.currentState!.save();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void _openCheckout() async{
    final dataPicker = Provider.of<Data>(context,listen: false);
    try{
      var orderOptions = {
        'amount': num.parse(_amount)*100,  // amount in the smallest currency unit
        'currency': 'INR',
        'receipt': '${dataPicker.phonenumber}+${DateTime.now().millisecond.toString()}'
      };

      final client = HttpClient();
      late String orderID = '';
      late String details = '';
      final request =
          await client.postUrl(Uri.parse('https://api.razorpay.com/v1/orders'));
      request.headers.set(
          HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
      String basicAuth = 'Basic ' +
          base64Encode(utf8.encode(
              '${'rzp_test_sYnxjKESzP77UK'}:${'ix9AGeQ1Ef2qdzcvU2Smd2i5'}'));
      request.headers.set(HttpHeaders.authorizationHeader, basicAuth);
      request.add(utf8.encode(json.encode(orderOptions)));
      final response = await request.close();
      await response.transform(utf8.decoder).listen((contents) {
        print('ORDERID' + contents);
        setState((){
          String orderId = contents.split(',')[0].split(":")[1];
          orderId = orderId.substring(1, orderId.length - 1);
          orderID = orderId;
          details = contents;
        });
      });
      print(orderID);

      await FirebaseFirestore.instance.collection('order_id').doc(orderID).set(
          {
            'order_id' : orderID,
            'details': details,
            'email' : dataPicker.email,
          }
      );

      var options = {
        'key': 'rzp_test_sYnxjKESzP77UK',
        'amount': num.parse(_amount)*100,
        'name': 'Auto Vally',
        'description': 'Pay for your ride',
        'order_id': orderID,
        'prefill': {
          'contact': dataPicker.phonenumber,
          'email': dataPicker.email,
        }
      };
      _razorpay.open(options);
    }catch(e){
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async{

    print('${response.orderId}/${response.paymentId}/${response.signature}');

    Get.offAll(HomeScreen());

    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration: Duration(seconds: 3 ,milliseconds: 400),
      margin: EdgeInsets.all(40),
      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Text('Payment Successful',style: TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
        textAlign: TextAlign.center,),
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response){
    print(response.message);
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(40),
      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Text('Error Payment not done',style: TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
        textAlign: TextAlign.center,),
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(40),
      backgroundColor: Color(0xfff0f0f0).withOpacity(0.98),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Text('External Wallet initiated',style: TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
        textAlign: TextAlign.center,),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          backgroundColor: Color(0xff6476fe),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
          title: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width/4,),
              Text('Payment',style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Align(
            alignment: Alignment.center,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/25,),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      child: FittedBox(
                        child: Text('Payment Amount',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),

                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Form(
                      key: _formkey,
                      child: TextFormFieldUI(
                          inputicon: Icon(Icons.payment_outlined,color:Color(0xff6476fe),),
                          hintText: 'Specify Amount',
                          hintTextStyle:  GoogleFonts.openSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff6476fe),
                          ),
                          validatefunction: ValidationBuilder().minLength(1).build(),
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onSave:(value){
                            if(value== null){
                              return;
                            }
                            setState((){
                              _amount = value;
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  NavButton(
                    buttoncolor: Color(0xff6476fe),
                    ButtonVoidCallBack: (){
                      _trySubmit();
                      _openCheckout();
                    },
                    buttonChild: Text('Proceed',style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                    Height: 50,
                    Width: MediaQuery.of(context).size.width/1.5,),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
