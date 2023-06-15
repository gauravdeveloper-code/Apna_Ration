import 'package:apna_ration_app/View/Screens/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../Utilities/Constants/Colors.dart';
import '../Widgets/TextStyle.dart';
import 'Phone_Screen.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();
  String otp='';
  final FirebaseAuth auth = FirebaseAuth.instance;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  late var focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  );
  late var submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3,
                      child: Image.asset('Assets/Images/otp.png',fit: BoxFit.contain,)
                  ),
                  SizedBox(height: 20,),
                  Text('Phone Verification',style: TextStyle(color: primary,fontSize: 30),),
                  SizedBox(height: 20,),
                  MyTextStyle(
                      text: 'Enter the otp sent in your\n         Phone Number',
                      color: primary
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    child :
                    Pinput(
                      length: 6,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onChanged: (value){
                        otp = value.toString();
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () async{
                          try{
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                                verificationId: PhoneScreen.verificationId,
                                smsCode: otp
                            );
                            await auth.signInWithCredential(credential);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> MainScreen()));
                          }
                          catch(e){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something Went Wrong!')));
                          }
                        },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primary)
                      ),
                        child: Text('Verify'),
                    ),
                  )
                ],
              ),
      ),
          )),
    );
  }
}
