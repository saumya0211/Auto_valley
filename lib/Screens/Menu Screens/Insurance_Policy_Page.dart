import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsurancePolicyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Color(0xff6476fe),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Align(
          alignment: Alignment.topCenter,
          child: Text('Insurance Policy',style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width/1.1267,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/1.127,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Text('Travel Insurance Policy and Eligibility',style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Color(0xff6476fe),
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Text('• AutoVally Vehicles is at full liberty to inspect its'
                    ' assets before proceeding to claim insurance and its'
                    ' decision will be considered legitimate under all'
                    ' circumstances and situations.',style:
                TextStyle(fontSize: 17.1,),),
                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('•  AutoVally Vehicles assets (the two-wheeler) will'
                    ' be insured in totality. Any deficit amount'
                    ' outstanding at the end of claiming insurance and'
                    ' damage repairs will have to be completely borne by'
                    ' the user.',style:
                TextStyle(fontSize: 17.1,),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• In case of a misfortunate incident involving a'
                    ' third party, he/she is covered under the insurance'
                    ' and will be eligible to claim an amount tentative to'
                    ' various factors such as lifestyle, tax returns, and'
                    ' rent, etc.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• For any damages incurred to a AutoVally Vehicles'
                    ' asset (the two-wheeler), the user will be held'
                    ' responsible for bearing all the charges up to INR'
                    ' 10,000.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• For any damages incurred to a AutoVally Vehicles'
                    ' asset (the two-wheeler) amounting to more than'
                    ' INR 10,000, the user is eligible to claim insurance'
                    ' to cover the charges that imply including the rental'
                    ' cost incurred during the downtime period of the'
                    ' asset which is a time period otherwise utilized by'
                    ' another AutoVally Vehicles user.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• The user is eligible to claim insurance only if he/'
                    ' she has opted for insurance coverage at the time of'
                    ' booking by completely paying the amount as'
                    ' displayed on the website. Any person driving a'
                    ' AutoVally Vehicle must be a registered user of'
                    ' AutoVally website',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• Members must be 21 years of age or older to rent'
                    ' a Vehicle from AutoVally.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• Member must have had no alcohol or drug-'
                    ' related driving violations in the past years.',style: TextStyle(
                  fontSize: 17.1,
                ),),

                SizedBox(height: MediaQuery.of(context).size.height/43,),
                Text('• Member must possess a valid two-wheeler Indian'
                    ' license (exceeding 50 CC), if not a citizen of India;'
                    ' member must have a valid passport and'
                    ' international motorcycle driver\'s license. The license'
                    ' should mention member is permitted to drive a'
                    ' motorcycle.',style: TextStyle(
                  fontSize: 17.1,
                ),),
                SizedBox(height: MediaQuery.of(context).size.height/43,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
