import 'dart:async';
import 'package:apna_ration_app/View/Screens/MainScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
 @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return(
        Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset('Assets/Images/splash.png',alignment: Alignment.center,
            fit: BoxFit.fill,),
        ),
      ),
    ));
  }
}
