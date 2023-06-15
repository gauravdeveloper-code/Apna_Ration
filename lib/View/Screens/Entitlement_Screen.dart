import 'package:apna_ration_app/View/Utilities/Constants/Colors.dart';
import 'package:apna_ration_app/View/Widgets/MyButtons.dart';
import 'package:apna_ration_app/View/Widgets/TextStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Entitlement_Screen extends StatefulWidget {
  const Entitlement_Screen({Key? key}) : super(key: key);
  @override
  State<Entitlement_Screen> createState() => _Entitlement_ScreenState();
}

class _Entitlement_ScreenState extends State<Entitlement_Screen> {
   String number='';
   String wheat='';
   String rice='';
   String sugar='';
   String pulse='';
   String month='';
   bool isloading = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextStyle(color: primary,text: 'Entitlement',),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 150,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  transformAlignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.all(0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: primary),
                    cursorColor: primary,
                    maxLength: 12,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        labelText: 'Ration Card Number...',
                        labelStyle: TextStyle(color: primary),
                        focusColor: primary,
                    ),
                    onChanged: (value){
                      number = value;
                    },
                  ),
                )
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
                    wheat = data['Wheat'].toString();
                    rice = data['Rice'].toString();
                    sugar = data['Sugar'].toString();
                    pulse = data['Pulse'].toString();
                    month = data['Month'].toString();
                  });
                },
              ),
              SizedBox(height: 50,),
              Container(
                height: 40,
                color: primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyTextStyle(text: 'Month', color: Colors.white),
                    MyTextStyle(text: 'Quantity Alloated', color: Colors.white)
                  ],
                ),
              ),
              (isloading) ? Container(margin: EdgeInsets.all(30),child: CircularProgressIndicator(color: primary)) :
              Table(
                border: TableBorder.all(color: primary,width: 1,),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0:FlexColumnWidth(2)
                },
                children: [
                  TableRow(
                    children: [
                      SizedBox(height: 30,child: Center(child: Text(''))),
                      SizedBox(height: 30,child: Center(child: Text('wheat'))),
                      SizedBox(height: 30,child: Center(child: Text('sugar'))),
                      SizedBox(height: 30,child: Center(child: Text('rice'))),
                      SizedBox(height: 30,child: Center(child: Text('pulse'))),
                    ]
                  ),
                  TableRow(
                      children: [
                        SizedBox(height: 30,child: Center(child: Text(month.toString()))),
                        SizedBox(height: 30,child: Center(child: Text(wheat.toString()))),
                        SizedBox(height: 30,child: Center(child: Text(sugar.toString()))),
                        SizedBox(height: 30,child: Center(child: Text(rice.toString()))),
                        SizedBox(height: 30,child: Center(child: Text(pulse.toString()))),
                      ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

