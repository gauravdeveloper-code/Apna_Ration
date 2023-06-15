import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Utilities/Constants/Colors.dart';
import '../Widgets/MyButtons.dart';
import '../Widgets/TextStyle.dart';

class Lot_Tracking_Screen extends StatefulWidget {
  const Lot_Tracking_Screen({Key? key}) : super(key: key);

  @override
  State<Lot_Tracking_Screen> createState() => _Lot_Tracking_ScreenState();
}

class _Lot_Tracking_ScreenState extends State<Lot_Tracking_Screen> {

  bool isloading = false;
  bool ware=false;
  bool sorting=false;
  bool delivery=false;
  bool ldc=false;
  bool consumer=false;
  var number='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextStyle(color: primary,text: 'LotTracking',),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primary),
      ),
      body: (
      SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      setState(() {
                        number=value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: primary
                        ),
                      ),
                      hintText: 'Ration Card No...',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                Outlined_Button(
                  text: 'Search',
                  width: 150.0,
                  color: primary,
                  button_color: Colors.white,
                  onpress: ()async {
                    DocumentReference documentRef = FirebaseFirestore.instance.collection('User').doc(number);
                    DocumentSnapshot snapshot = await documentRef.get();
                    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
                    isloading=true;
                    setState(() {
                    });
                    Future.delayed(Duration(seconds: 2),(){
                      setState(() {
                        isloading=false;
                      });
                    });
                    setState(() {
                      ware =  data['Warehouse'];
                      sorting = data['Sorting-Facility'];
                      delivery = data['Delivery-Hub'];
                      ldc = data['Local-Distribution-Center'];
                      consumer = data['Consumer'];
                    });
                  },
                ),
                SizedBox(height: 200,),
                Container(
                  color: primary,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextStyle(text: 'Location', color: Colors.white),
                      MyTextStyle(text: 'Status', color: Colors.white),
                    ],
                  ),
                ),
                Table(
                  border: TableBorder.all(color: primary,width: 1,),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                        children: [
                          SizedBox(height: 30,child: Center(child: Text('WareHouse'))),
                          SizedBox(height: 30,child: (ware)? Center(child: Icon(Icons.check_box,color: Colors.green,)) :  Center(child: Icon(Icons.cancel_presentation,color: Colors.red,)))
                        ]
                    ),
                    TableRow(
                        children: [
                          SizedBox(height: 30,child: Center(child: Text('Sorting-Facility'))),
                          SizedBox(height: 30,child: (sorting)? Center(child: Icon(Icons.check_box,color: Colors.green,)) :  Center(child: Icon(Icons.cancel_presentation,color: Colors.red,)))
                        ]
                    ),
                    TableRow(
                        children: [
                          SizedBox(height: 30,child: Center(child: Text('Delivery-Hub'))),
                          SizedBox(height: 30,child: (delivery)? Center(child: Icon(Icons.check_box,color: Colors.green,)) :  Center(child: Icon(Icons.cancel_presentation,color: Colors.red,)))
                        ]
                    ),
                    TableRow(
                        children: [
                          SizedBox(height: 30,child: Center(child: Text('Local-Distribution-Center'))),
                          SizedBox(height: 30,child: (ldc)? Center(child: Icon(Icons.check_box,color: Colors.green,)) :  Center(child: Icon(Icons.cancel_presentation,color: Colors.red,)))
                        ]
                    ),
                    TableRow(
                        children: [
                          SizedBox(height: 30,child: Center(child: Text('Consumer'))),
                          SizedBox(height: 30,child: (consumer)? Center(child: Icon(Icons.check_box,color: Colors.green,)) :  Center(child: Icon(Icons.cancel_presentation,color: Colors.red,)))
                        ]
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      )
      ),
    );
  }
}
