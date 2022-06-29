import 'package:auto_valley/Widgets/NavButton.dart';
import 'package:auto_valley/Widgets/NavButtonv2.dart';
import 'package:auto_valley/models/Home_Screen/DownScreenDropItems.dart';
import 'package:flutter/material.dart';

class Item {
  Widget name;
  Widget description;
  bool isExpanded;

  Item({
    required this.name,
    required this.description,
    this.isExpanded = false,
  });

}

class DownScreen extends StatefulWidget {

  @override
  State<DownScreen> createState() => _DownScreenState();
}

class _DownScreenState extends State<DownScreen> {

  List<Item> _items = [
  Item(name:  ListTile(
    leading: Icon(Icons.bike_scooter_outlined,color: Color(0xff6476fe),),
    title:  Text('Category',style: TextStyle(color:Color(0xff6476fe) ),),
  ),
      description: Row(
        children: [
          DropDownItem(text: 'Bike On Rent'),
        ],
      )),

    Item(name:  ListTile(
      leading: Icon(Icons.bike_scooter_outlined,color: Color(0xff6476fe),),
      title:  Text('Manufactures',style: TextStyle(color:Color(0xff6476fe) ),),
    ),
        description: Column(
          children: [
            Row(
              children: [
                DropDownItem(text: 'Hero'),
                DropDownItem(text: 'Bajaj'),
                DropDownItem(text: 'Ampere'),
                DropDownItem(text: 'TVS'),
                DropDownItem(text: 'Royal Enfield'),
              ],
            ),
            Row(
              children: [
                DropDownItem(text: 'KTM'),
                DropDownItem(text: 'Honda'),
                DropDownItem(text: 'Tata'),
                DropDownItem(text: 'Ford'),
                DropDownItem(text: 'Oxygen'),
              ],
            ),
          ],
        ),),

    Item(name: ListTile(
      leading: Icon(Icons.bike_scooter_outlined,color: Color(0xff6476fe),),
      title:  Text('Models',style: TextStyle(color:Color(0xff6476fe) ),),
    ),
        description: Column(
          children: [
            Row(
              children: [
                DropDownItem(text: 'KTM DUKE'),
                DropDownItem(text: 'CT 100'),
                DropDownItem(text: 'Maestro'),
                DropDownItem(text: 'HF Deluxe'),
              ],
            ),
            Row(
              children: [
                DropDownItem(text: 'CD 110'),
                DropDownItem(text: 'Platina'),
                DropDownItem(text: 'Activa 5G'),
                DropDownItem(text: 'Zeal'),
              ],
            ),
          ],
        ),),
  ];

  ExpansionPanel _buildExpansionPanel(Item item) {
    return ExpansionPanel(
      isExpanded: item.isExpanded,
      backgroundColor: Colors.white,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
         child: item.name,
        );
      },
      body:Container(
        child: item.description,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height/1.8,
        color: Colors.white,
        child: Column(children: [
          SizedBox(height: 10,),
          Material(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            elevation: 20,
            child:Container(
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(11)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close,size: 20,)),

                  Text('Filter',style: TextStyle(color: Color(0xff6476fe),fontSize: 18),),

                  NavButtonv2(
                    boxBorder: Border.all(color:  Color(0xff6476fe),width: 1),
                    buttoncolor: Colors.white,
                    ButtonVoidCallBack: (){
                      Navigator.pop(context);
                    },
                    buttonChild: FittedBox(
                      child: Text('Submit',style: TextStyle(
                        color: Color(0xff6476fe),
                      ),),
                    ),
                    Height: MediaQuery.of(context).size.height/28,
                    Width: MediaQuery.of(context).size.width/5, )
                ],
              ),
            ) ,
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width/1.1,
            height: MediaQuery.of(context).size.height/2 - 20 -MediaQuery.of(context).size.height/12,
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  child: ExpansionPanelList(
                    children:  _items.map((item) => _buildExpansionPanel(item))
                        .toList(),
                    expansionCallback: (index,isExpanded){
                      setState((){
                        _items[index].isExpanded = !isExpanded;
                      });
                    },
                    animationDuration: Duration(milliseconds: 400),
                    elevation: 4,
                  ),
                ),
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
