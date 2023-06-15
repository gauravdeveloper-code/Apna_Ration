import 'package:apna_ration_app/View/Widgets/TextStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utilities/Constants/Colors.dart';
import 'Otp_Screen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);
  static String verificationId = '';
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  var phoneNumber;

  Future<void> phoneAuthentication(String phoneNumber) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credentials) async {
          await auth.signInWithCredential(credentials);
        },
        verificationFailed: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something went Wrong')));
        },
        codeSent: (verificationId, codeResend) {
          PhoneScreen.verificationId = verificationId;
          if(verificationId.isNotEmpty)
          {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>OtpScreen())
            );
          }
        },
        codeAutoRetrievalTimeout: (verificationId) {}
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3,
                      child: Image.asset('Assets/Images/phone.png',fit: BoxFit.contain,)
                  ),
                  SizedBox(height: 20,),
                  Text('Phone Verification',style: TextStyle(color: primary,fontSize: 30),),
                  SizedBox(height: 20,),
                  MyTextStyle(
                      text: 'We need to register your phone \n       before getting  started !',
                      color: primary),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 320,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      style: TextStyle(color: primary),
                      cursorColor: primary,
                      maxLength: 10,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: primary)
                        ),
                        labelText: 'Phone Number...',
                          labelStyle: TextStyle(color: primary),
                        focusColor: primary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: (){
                          phoneNumber = '+91 ' + phoneController.text.toString();
                          phoneAuthentication(phoneNumber);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primary),

                        ),
                        child: Center(child: Text('Send the code'))
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
