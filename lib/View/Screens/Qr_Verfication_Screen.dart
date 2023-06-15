import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Utilities/Constants/Colors.dart';
import '../Widgets/TextStyle.dart';

class Qr_Verification_Screen extends StatefulWidget {
  const Qr_Verification_Screen({Key? key}) : super(key: key);

  @override
  State<Qr_Verification_Screen> createState() => _Qr_Verification_ScreenState();
}

class _Qr_Verification_ScreenState extends State<Qr_Verification_Screen> {

  var _razorpay = Razorpay();
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  var amount=0;
  TextEditingController amountController = TextEditingController();

  void qr(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result=event;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Sucess'),
      content: Text('Payment Id : ${response.paymentId} ${response.orderId} ${response.signature}'),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))
      ],
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Payment Failed'),
      content: Text('Error : ${response.error} ${response.message} ${response.code}'),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))
      ],
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Sucess'),
      content: Text('Wallet Name : ${response.walletName}'),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextStyle(color: primary,text: 'Payment',),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: (
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  child: QRView(key: _globalKey, onQRViewCreated: qr),
                  height: 400,
                  width: 350,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
                margin: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.grey,
              ),
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  onChanged: (value){
                    setState(() {
                     (value==null) ? amount=0 :  amount = int.tryParse(value)!;
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
                    hintText: 'Enter Amount...',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => primary),
                ),
                onPressed: (){
                  if(amount==0 || amount==null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Some Amount'),backgroundColor: Colors.red,));
                  }
                  else
                  {
                    var total=amount;
                    var name = 'Testing';
                    var description = 'Test Payment';
                    var options = {
                      'key': 'rzp_test_8CgUe9XmE711SJ',
                      'amount': total*100,
                      'name': name,
                      'description': description,
                      'prefill': {
                        'contact': '9818021325',
                        'email': 'gouravmourya70@gmail.com'
                      }
                    };
                    try{
                      _razorpay.open(options);
                    }
                    catch(e){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Text('Error'),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))
                        ],
                      ));
                    }
                  }
              }, child: Text('Make Payment'),)
            ],
          )
          ),
        ),
      ),
    );
  }
}

