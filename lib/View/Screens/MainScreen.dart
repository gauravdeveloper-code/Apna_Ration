import 'package:apna_ration_app/View/Appbars/BottomNavbar.dart';
import 'package:apna_ration_app/View/Screens/Entitlement_Screen.dart';
import 'package:apna_ration_app/View/Screens/Lot_Tracking_Screen.dart';
import 'package:apna_ration_app/View/Screens/NavDrawer.dart';
import 'package:apna_ration_app/View/Screens/Qr_Verfication_Screen.dart';
import 'package:apna_ration_app/View/Screens/Registration_Screen.dart';
import 'package:apna_ration_app/View/Screens/Shops_Screen.dart';
import 'package:apna_ration_app/View/Screens/Transaction_Screen.dart';
import 'package:apna_ration_app/View/Utilities/Constants/Colors.dart';
import 'package:flutter/material.dart';

import '../Widgets/TextStyle.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APNA RATION',style: TextStyle(color: primary),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: primary),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset('Assets/Images/satya.png',fit: BoxFit.contain))
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(color: primary,height: 8,),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(15),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 40,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MapSample()));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: primary
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset('Assets/Images/shops.png'),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MyTextStyle(color: primary,text: 'Near By Shops',),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Transaction_Screen()));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: primary
                                    ),
                                    color: primary,
                                  ),
                                  child: Image.asset('Assets/Images/transacitons.png',
                                  fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MyTextStyle(color: primary,text: 'My Transactions',)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration_Screen()));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: primary
                                    ),
                                    color: primary,
                                  ),
                                  child: Image.asset('Assets/Images/registration.png',
                                  fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MyTextStyle(color: primary,text: 'Registration',)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Entitlement_Screen()));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: primary
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset('Assets/Images/entitlement.png'),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MyTextStyle(color: primary,text: 'Entitlement',),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Qr_Verification_Screen()));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: primary
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset('Assets/Images/qr.png'),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MyTextStyle(color: primary,text: 'Qr Verification',),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Lot_Tracking_Screen()));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: primary
                                    ),
                                    color: primary,
                                  ),
                                  child: Image.asset('Assets/Images/lot.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MyTextStyle(color: primary,text: 'Lot Tracking',)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: primary,
              height: 10,
            )
          ],
        )
      ),
      drawer: NavDrawer(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
