import 'package:auto_valley/Widgets/Hyperlinks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {

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
          child: Text('Privacy & Policy',style: GoogleFonts.poppins(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/40,),

                  Row(
                    children: [
                      Text('PRIVACY POLICY ',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff6476fe),
                      ),),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.asset('images/auto_vally_heading.png',fit: BoxFit.fill,).image,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                 
                  Text('• By registering at AutoVally you agree to the following'
                      ' terms and conditions.',style:
                  TextStyle(fontSize: 17.1,),),
                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('•  By registering at AutoVally, you accept all the Terms'
                      ' and Conditions and the Privacy Policies and that you are'
                      ' fully responsible for all activities that occur under your'
                      ' username and password. You will keep your username and'
                      ' password safe, and won\'t share them with anyone. You'
                      ' will not pass yourself off as someone else or create'
                      ' multiple, false accounts.',style:
                  TextStyle(fontSize: 17.1,),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• Personally Identifiable Information stored by the'
                      ' AutoVally lets us know the specifics of who you are. It'
                      ' may include but is not limited to your name, mailing'
                      ' address, phone number, email address, employer, and job'
                      ' title. We request Personally Identifiable Information when'
                      ' you order a product or service, participate in certain'
                      ' promotional activities, fill out surveys, and correspond'
                      ' with us. Unique identifiers (such as membership numbers'
                      ' or email addresses) are collected from website visitors to'
                      ' verify the user\'s identity and for use as account numbers'
                      ' in our record system. Financial information (such as their'
                      ' bank account or credit card numbers) is collected and'
                      ' used where appropriate to bill the customer for services.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• AutoVally seeks to ensure that your information and'
                      ' preferences are accurate and complete and ensure'
                      ' that we don\'t hold personal information any longer'
                      ' than is necessary. If you wish to view or change your'
                      ' information, where possible you may do this online.'
                      ' Alternatively by sending an email with your name, full'
                      ' mailing address, email address, and relevant'
                      ' information about subscriptions and registrations'
                      ' you have with us to the customer support team at',style: TextStyle(
                    fontSize: 17.1,
                  ),),
                   Hyperlinks(text: 'contact.www.autovally.in.', fontsize: 17.1),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• These terms and/or your use of the website shall be'
                      ' governed by and construed in accordance with Indian law'
                      ' and the Indian Courts shall have exclusive jurisdiction'
                      ' over any dispute which may arise.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• AutoVally acknowledges your trust and is committed to'
                      ' protecting the information you provide. To prevent'
                      ' unauthorized access, maintain accuracy, and ensure'
                      ' proper use of information, we employ physical, electronic,'
                      ' and managerial processes to safeguard and secure the'
                      ' information we collect online. Our site has security'
                      ' measures in place to protect against the loss, misuse, and'
                      ' alteration of the information under our control. These'
                      ' include but are not limited to a secured database'
                      ' containing personal data. The database is located off the'
                      ' main web server and is not accessible directly.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Use of Information',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• We will use all your personal information to'
                      ' provide you a better rental experience through',style: TextStyle(
                    fontSize: 20,
                  ),),
                  Hyperlinks(text: 'www.autovally.in', fontsize: 20),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('• To give you proper information about the best'
                      ' rental product for you',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To update you on various new product and'
                        ' services',style: TextStyle(
                          fontSize: 17.1,
                      ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To send you a statement or invoice',style: TextStyle(
                          fontSize: 17.1,
                      ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To collect and refund the payment to you',style: TextStyle(
                           fontSize: 17.1,
                      ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To Marketing/Advertising/Promotional or Business'
                       ' communications',style: TextStyle(
                           fontSize: 17.1,
                      ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To notify you of various security and'
                      ' administrative issues',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To respond to your queries and questions',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('• To send you the information that may be of'
                      ' interest to you',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Grievances',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('If you have any grievances against the Website\'s privacy'
                      ' practices, or you apprehend that your privacy is compromised'
                      ' at the Website, please Mail us at autovallyrentals@gmail.com'
                      ' or call us at the mobile number we assure you, we will pro-'
                      ' actively address your concerns.' ,style: TextStyle(
                    fontSize: 14,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Consent',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('By providing your information and using the website, you'
                      ' consent to the Privacy Policy. Including but not limited to'
                      ' your consent for sharing your information as per this'
                      ' privacy policy. If we decide to change our privacy policy,'
                      ' we can change any policy at any point in time and will'
                      ' post those changes on this page so that you are always'
                      ' aware of what information we collect, how we use it, and'
                      ' under what circumstances we disclose it, you can see all'
                      ' these changes on our website timely.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('USER DOCUMENTATION',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Prior to receiving possession of the Vehicle, you'
                      ' shall be required to provide the following'
                      ' documents to AutoVally Vehicles:' ,style: TextStyle(
                    fontSize: 20,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Valid driving license to ride a motorcycle with/without'
                      ' gear, depending on the Vehicle proposed to be hired, in'
                      ' India,',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  We will keep holding of an original ID card until the'
                      ' recur is complete after such as passport/Aadhar Card/'
                      ' Voter ID which shall be obtained by AutoVally Vehicles’'
                      ' staff at the time of vehicle pick-up/drop-off.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  In the event, the documentation provided by a user is'
                      ' fake or invalid, the same would attract a penalty as'
                      ' detailed under clause 7',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•   As a mandatory policy, individual customer who have'
                      ' placed a booking are requested to show one of their'
                      ' original government verified ID proof such as Aadhar'
                      ' card Voter ID card, Passport, etc, as leverage during'
                      ' vehicle pick-up. No private organization\'s ID will be'
                      ' accepted for the same. The ID ecard will be returned at the'
                      ' time of booking completion.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Use of Information',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('The user\'s first name and booking details may be used for'
                      ' showing booking popups to other users on our homepage. No'
                      ' other personally identifiable information will be shown. Please'
                      ' read the Privacy Policy for more details regarding the use of'
                      ' information. You’re Purchase of Services and Services Availability.'
                      ' Specific terms and conditions apply to your purchase of services'
                      ' from AutoVally and to specific portions or features of the'
                      ' AutoVally Websites. AutoVally\'s obligations with regards to its'
                      ' services offered on the AutoVally Websites are governed solely by'
                      ' such terms and conditions and nothing contained on the'
                      ' AutoVally Websites or in these Terms shall be construed to alter'
                      ' terms and conditions that are specific to services. The materials'
                      ' on the AutoVally Websites with respect to services may be'
                      ' outdated and AutoVally makes no commitment to update such'
                      ' material. Not all services mentioned in these materials will be'
                      ' available in your country and such references do not imply that'
                      ' AutoVally will make available such services in your country. Please'
                      ' consult your local for information regarding the availability of'
                      ' particular service offerings in your country.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('PICK AND DROP PROCESS',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),

                  Text('Delivery Process',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('•  Lessee has to be present at the agreed date and time to'
                      ' pick up the Vehicle.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  The delivered vehicle cannot be rejected after handover.'
                      ' Once accepted by Lessee or his/her representative at the'
                      ' time of pickup, the vehicle is not to be returned before'
                      ' the agreed contract period. The lessee should do a quality'
                      ' test of the Vehicle before he accepts the Vehicle from'
                      ' Lessor.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Though we do quality checks at our end before delivery,'
                      ' the lessee is expected to see if there are any damages and'
                      ' report the same to the representative of the lessor and'
                      ' photos shall be captured of the same.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  One signed copy of the contract is to be kept by each'
                      ' party.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),

                  Text('Handover Process',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Lessee has to inform us 2 hrs in advance before the end'
                      ' of the Contract Period.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  The pick-up date and time will be mutually decided by'
                      ' the lessee and us. The drop—off location will be the same'
                      ' as the pick-up location.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  The lessee has to be present at the agreed date and'
                      ' time.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),

                  Text('USE OF THE VEHICLE AND CONDUCT',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  The user warrants that he/she shall use the Vehicle in'
                      ' accordance with all applicable laws including the Motor'
                      ' Vehicles Act, 1988 and all rules framed thereunder, and'
                      ' shall not use the Vehicle for, or carry out while using the'
                      ' Vehicle, any illegal or unlawful activities.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  The user shall be responsible for all charges and costs'
                      ' incurred with respect to the Vehicle for the entire period'
                      ' of the reservation and until the Vehicle is returned in a'
                      ' manner acceptable to AutoVally Vehicles.'
                      ' Vehicle, any illegal or unlawful activities.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  The user agrees and acknowledges that AutoVally'
                      ' Vehicles prohibits the use of the Vehicle in the following'
                      ' manner.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  With more than two (2) people on the vehicle',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Seating or accommodating pets on the vehicle.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Under the influence of alcohol and/or drugs or other banned'
                             ' substances or consuming tobacco or tobacco products on the'
                             ' vehicle.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  For or in any kind of race, contest or competition, or stunts.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Tampering with, disassembling, or in any way altering the'
                            ' vehicle or any of its parts without prior authorization from'
                            ' AutoVally Vehicles on a need basis.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  uncommon usage, irresponsible riding methods, overstressing'
                            ' and mishandling the motorcycles causing excessive wear of the'
                            ' vehicle parts and undue damage:',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  To carry unlawful! hazardous or prohibited material;',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Using the incorrect fuel for the vehicle',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),


                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Commercial usage of any type deriving financial benefits',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Attaching any external structures to cur motorcycles causing'
                            ' damage to the vehicle or other vehicles/human beings/animals'
                            ' coming in contact with it.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•   Any other inappropriate Use of the vehicle',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  In the event of any traffic violation by you while using or'
                      ' involving the Vehicle and/or your driving license you shall'
                      ' notify AutoVally Vehicles of the same immediately. You'
                      ' acknowledge that you shall be liable to pay all fines/'
                      ' penalties associated with such traffic violation (including'
                      ' parking, speeding, riding without a helmet, cutting'
                      ' signals, etc), and AutoVally Vehicles shall have no'
                      ' responsibility with respect to the same.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•   The rental of the Vehicle is a right specific to the user,'
                      ' and cannot be transferred or granted to any third party. In'
                      ' the event the Vehicle is operated by any third party, the'
                      ' same shall amount to a Penalty Event.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),

                  Text('ACCIDENTS AND BREAKDOWNS',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('You understand that while AutoVally Vehicles ensures'
                      ' that all its vehicles are maintained in the best manner,'
                      ' prone to faults and breakdowns in rare situations. These'
                      ' vehicles are susceptible to breakdown once in a while'
                      ' owing to many uncontrollable situations. All breakdowns'
                      ' or incidents involving a Vehicle must be intimated to'
                      ' AutoVally Vehicles immediately, and we shall ensure a'
                      ' mechanic or other professional is assigned to rectify such'
                      ' defect, or a replacement is provided to you.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('In the event of an accident leading to the damage of the'
                      ' Vehicle or any damage or injury to a third party and/or'
                      ' vehicle, you must immediately inform AutoVally Vehicles :',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('(i) fill out an official police report form',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('(ii) provide an accident report to AutoVally Vehicles in'
                       ' the manner prescribed',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('(iii)  provide the following information to AutoVally'
                      ' Vehicles:',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Date, time, and place of accident',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The license plate numbers of any other vehicles involved',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The names, addresses, and driver\'s license numbers of the'
                            ' persons involved in the accident, or the name, address, and'
                            ' driver\'s license number of the owner of the vehicle (if he or'
                            ' she is not the driver)',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The name, addresses, and phone number of witnesses,'
                            ' passengers, and any other involved persons, where possible.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Circumstances of the accident. The user shall be'
                            ' responsible for the costs related to the repair, recovery, and'
                            ' loss of use of any Vehicle resulting from any such accident'
                            ' to the extent that insurance coverage does not provide for'
                            ' the same. The user agrees and acknowledges that he/she'
                            ' shall be wholly responsible for all damages and costs arising'
                            ' from his/her failure to comply with these terms.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('BREACH',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('In the event of a breach of any of the provisions of this'
                      ' Agreement, the User shall be liable to make good the damage'
                      ' caused to the Vehicle(s) and/or AutoVally Vehicles due to such'
                      ' breach. In the event of a breach of the provisions of Clause 5,'
                      ' where the breach has criminal consequences, AutoVally Vehicles'
                      ' reserves the right to initiate appropriate criminal proceedings'
                      ' against the user, and where there are no criminal consequences'
                      ' with respect to such breach, AutoVally Vehicles shall be at liberty'
                      ' to levy such penalty as decided under the Fee Policy.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Cancellation Policy as Below',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Between 0 - 6 hrs of the pickup time - 75% rental'
                             ' charges will be withheld',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Between 6-24 hrs of the pickup time: 50% of rental'
                             ' charges will be withheld.',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Between 24-72 hrs of the pickup time: 25% rental'
                            ' charges will be withheld.' ,style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  72 hrs or more prior to the pickup time: 10% of rental'
                            ' charges will be withheld.',style: TextStyle(
                          fontSize: 16.5,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('INDEMNITY',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('You agree to indemnify and hold AutoVally, its officers,'
                      ' directors, shareholders, predecessors, successors in'
                      ' interest, employees, agents, subsidiaries and affiliates,'
                      ' harmless from any demands, loss, liability, claims, or'
                      ' expenses (including attorneys’ fees), made against'
                      ' AutoVally by any third party due to or arising out of or in'
                      ' connection with your use of the Site.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('TERMINATION',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('AutoVally Vehicles may terminate these Terms, or your access to'
                      ' the Services in the event of a breach of any of the provisions of'
                      ' these Terms by you, with or without prior notice. AutoVally'
                      ' Vehicles may also stop providing the Services to you or all users'
                      ' when it is no longer practicable or feasible to do so Otherwise'
                      ' applicable sections of the Terms shall survive termination. In'
                      ' addition to any termination rights, we reserve the right to enforce'
                      ' and prosecute any violations of these Terms.',style: TextStyle(
                    fontSize: 16.2,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('GOVERNING LAW',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('This Agreement shall be governed by the laws of India,'
                      ' and the courts of Bangalore shall have exclusive'
                      ' jurisdiction with respect to any dispute arising here under.' ,style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Miscellaneous',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('You may not use or export or re-export any Content or any copy or'
                      ' adaptation of such Content, or any product or service offered on the'
                      ' Site, in violation of any applicable laws or regulations, including'
                      ' without limitation INDIA export laws and regulations. If any of the'
                      ' provisions of these Terms of Use are held by a court or other tribunal of'
                      ' competent jurisdiction to be void or unenforceable, such provisions'
                      ' shall be limited or eliminated to the minimum extent necessary and'
                      ' replaced with a valid provision that best embodies the intent of these'
                      ' Terms of Use, so that these Terms of Use shall remain in full force and'
                      ' effect.',style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Feedback and Information',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Any feedback you provide at this site shall be deemed to be'
                      ' non-confidential. AutoVally shall be free to use such'
                      ' information on an unrestricted basis. The information'
                      ' contained in this website is subject to change without notice.',style: TextStyle(
                    fontSize: 16.2,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('FEE POLICY',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Any feedback you provide at this site shall be deemed to'
                      ' be non-confidential. AutoVally shall be free to use such'
                      ' information on an unrestricted basis. The information'
                      ' contained in this website is subject to change without'
                      ' notice.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('Below is a comprehensive list of actions and respective fees'
                      ' AutoVally charges on booking Cancellation',style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6476fe),
                  ),),

                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•   Cancellation made more than 24hrs before booking'
                            ' start: \u{20B9}100',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Cancellation made within 24hrs of booking start: \u{20B9}100'
                            ' or 50 % of Booking Fee (whichever is greater)',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Cancellation made after booking start: No Refund. Only'
                            ' security deposit (if any) will be refunded.' ,style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The cancellation refund will be done through the'
                            ' original payment method within 4-8 working days',style: TextStyle(
                          fontSize: 16.5,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Extension Charges',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('The extended period will be billed at the standard'
                      ' hourly rental. There\'s no additional extension fee'
                      ' apart from normal charges for the period extended.'
                      ' Check the tariff page for an hourly rate. It is the'
                      ' member\'s responsibility to extend the booking'
                      ' through',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  Hyperlinks(text: 'contact.www.autovally.in', fontsize: 16.5),
                  Text(' before booking end time.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Reschedule before start Modifications made more than'
                             ' 24hrs before booking start \u{20B9}100',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('• Modifications made within 24hrs of booking start: 50%'
                             ' of the hourly fee of the time period no longer being used'
                             ' or \u{20B9}100, whichever is greater (If your initial booking was 8'
                             ' am-2 pm and you reschedule to 10 am-4 pm, you will incur'
                             ' a charge of 50% of the hourly fee of the 2 hours from 8'
                             ' am-10 am that are no longer being used or \u{20B9}100,'
                             ' whichever is greater)',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Shortening post-start: No charges or refunds applicable',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Late Return: \u{20B9}200 for each hour of delay + hourly rental'
                            ' ate for the vehicle.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Helmet Lost: 1200 rupees will be charged for helmet lost.'
                            ' We don\'t accept helmets bought by customers for'
                            ' replacement.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('NOTE',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Extension and modifications are subject to availability.' ,style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('• Extension and modifications are not allowed in bookings'
                            ' made under the commute plan' ,style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  Your free KMs are calculated based on the latest'
                             ' scheduled pickup time to the latest scheduled drop-off'
                             ' time or to the actual drop-off time whichever is later.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  All Refunds made shall be through the original payment'
                            ' account only within 4-8 working days.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  AutoVally reserves the right to charge a fee for specific'
                            ' pre-defined accessories.' ,style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('• Given below is a list of penalties that can be levied if'
                      ' members violate certain AutoVally rules.' ,style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w400,
                    color:Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('• Traffic and Parking violations: Full payment of fines +'
                      ' \u{20B9}500 per 30 days late in payment' ,style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('• No Show: Bookings will be canceled after 4 hours of'
                      ' booking start time. Failure to produce an original two-'
                      ' wheeler driving license with-in four hours of start time will'
                      ' also lead to auto cancellation of the booking.',style: TextStyle(
                    fontSize: 17.1,
                  ),),


                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  No refund on the booking fee. Security deposit (if any)'
                      ' will be refunded back.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Over speeding: Max Speed Limit: 70km/hr for scooters'
                      ' (110 CC); 90km/hr for other motorcycles.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Over speeding: Max Speed Limit: 120km/hr for Sports'
                      ' Vehicle (Above150 CC) as per government fines.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Over speeding Fine: 500 for each attempt (over and'
                      ' above any government fines that may have been levied)',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Expulsion from AutoVally if over speeding occurs in two'
                      ' bookings.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Key not returned at end of reservation \u{20B9}200 if returned'
                      ' within 3 days.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  \u{20B9}200 + lock replacement cost, if not returned within 3'
                      ' days',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Accident/Vehicle Damage: In the event of an accident or'
                      ' vehicle damage, the customer will be held liable for 100%'
                      ' of the vehicle damage and loss of business due to time'
                      ' taken during the repair. AutoVally representative shall'
                      ' provide damage estimation + loss of business amount to'
                      ' customer and customer is liable to pay the same at the'
                      ' time of vehicle drop-off.',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Towing and Impounding: No cost if caused by vehicle'
                      ' failure. (On-trip tire puncture is not covered. AutoVally will'
                      ' not be liable for puncture. Customer is solely responsible)',style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  Full cost: if caused by user negligence such as'
                      ' overspeeding or rule violation.' ,style: TextStyle(
                    fontSize: 17.1,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Responsibility for Payment',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('•  Payments by riders shall be made with his/her credit card,'
                      ' debit card, E-wallets, or cash. The rider is under obligation to'
                      ' ensure that the account from which the amounts are to be'
                      ' collected has sufficient funds or credit available to cover any'
                      ' charges. The rider is solely responsible for any associated bank'
                      ' or credit card charges or fees. A rider may be charged a'
                      ' processing fee for a declined credit or debit card payment.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  In the event, the rider defaults on any payments, AutoVally'
                      ' Vehicles is entitled to charge reminder fees and default'
                      ' interest in accordance with the provisions of the law. In'
                      ' addition, AutoVally Vehicles may utilize third parties to collect'
                      ' amounts owed to AutoVally Vehicles by a rider.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•  With all fees mentioned above, AutoVally Vehicles reserves'
                      ' the right to prohibit a rider from making a subsequent'
                      ' reservation until all outstanding fees in the rider\'s account'
                      ' have been paid in full. In the event a fee is incurred, riders will'
                      ' receive an invoice from AutoVally Vehicles that will have'
                      ' detailed payment instructions.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Collison or another incident',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The rider will be responsible for all towing and'
                            ' impounding charges associated with a collision.',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('• The rider will be responsible for all towing and'
                            ' impounding charges caused by rider failure.' ,style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•   AutoVally Vehicles will be responsible for all towing and'
                             ' impounding charges caused by vehicle failure.',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The rider will be responsible for all towing and'
                            ' impounding charges caused by rider failure.',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The rider will be responsible for all applicable damages'
                            ' and costs, including those in excess of the applicable'
                            ' Damage Fee, arising from the rider\'s failure to comply'
                            ' with the terms of the Agreement and/or a violation of'
                            ' the law.',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height/50,),
                        Text('•  The rider will be responsible for paying all tolls at the'
                            ' time they are due.',style: TextStyle(
                          fontSize: 16.5,
                        ),),

                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/43,),
                  Text('Exceptions',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff6476fe),
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•   In the event, the rider is found to be under the influence of'
                      ' alcohol during a booking, the rider will be held liable for 100%'
                      ' of the vehicle damage bill as per the invoice received from'
                      ' the vehicle workshop.' ,style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•   The rider will be liable for 100% of the entire vehicle'
                      ' damage bill in the event that the vehicle workshop and/or'
                      ' insurance company deem the damage to be consequential in'
                      ' nature (this will be clearly stated in the accident report).'
                      ' Consequential damage occurs when the rider continues'
                      ' undermining the condition of the vehicle.',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text('•    In the event of a puncture to the Vehicle\'s tires during such'
                      ' time the Vehicle is in the customer\'s possession (including'
                      ' change of tire tube and similar), the customer shall be liable'
                      ' to repair the same or pay the cost of repair to AutoVally'
                      ' Vehicles.' ,style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),

                  FittedBox(
                    child: Row(
                      children: [
                        Text('• Operating Hours:  ',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),),
                        Text('All our hub stations are',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),
                  Text(
                      ' operational from 09:00 AM to 09:00 PM, all seven days a week. All'
                      ' pickup/return should be completed maximum before'
                      ' 09:00 PM. In case the rider fails to pickup/return the'
                      ' vehicle by 09:00 PM, the pickup/return will take place on'
                      ' the next day and the applicable charges will be levied on'
                      ' the rider. No pickup/return request will be entertained'
                      ' post 09:00 PM.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),

                  FittedBox(
                    child: Row(
                      children: [
                        Text('• Misconduct:     ',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),),
                        Text('Any misconduct with the ',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),
                  Text(
                      '  station executive by the rider under the influence of alcohol or'
                      ' otherwise will result in the cancellation of the booking.'
                      ' The rider will not be liable for any refunds in such a case.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),

                  FittedBox(
                    child: Row(
                      children: [
                        Text('• Customer Care Timings:   ',style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black54,
                        ),), 
                        Text('08:00 AM to 12:00 AM.',style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black45,
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text(
                      ' AutoVally reserves the right to change the terms of this Policy'
                      ' from time to time and shall give notice of such changes to'
                      ' the member in a timely manner. Notice to the members shall'
                      ' be considered given when such notice is indicated and',style: TextStyle(
                    fontSize: 16.5,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text(' (1) the effective date indicated in such notice',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text(' (2) on the date posted on AutoVally\'s website.',style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black45,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
