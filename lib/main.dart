import 'package:apna_ration_app/View/Screens/Splash_screen.dart';
import 'package:apna_ration_app/View/Utilities/Constants/Colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: primary),
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen()
    );
  }
}