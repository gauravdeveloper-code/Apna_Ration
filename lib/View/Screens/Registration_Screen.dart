import 'dart:typed_data';
import 'package:apna_ration_app/Logic/Utilities/FirebaseImageStorage/ImageStorage.dart';
import 'package:apna_ration_app/View/Appbars/BottomNavbar.dart';
import 'package:apna_ration_app/View/Utilities/Constants/Colors.dart';
import 'package:apna_ration_app/View/Widgets/MyButtons.dart';
import 'package:apna_ration_app/View/Widgets/TextStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Utilities/Constants/Strings.dart';
import '../Utilities/Functions/ImagePicker.dart';
import 'MainScreen.dart';

const List<String> list = <String>
['Above Poverty Line', 'Below Poverty Line', 'Antyodaya Card', 'Priority HouseHold'];

class Registration_Screen extends StatefulWidget {
  Registration_Screen({Key? key}) : super(key: key);

  @override
  State<Registration_Screen> createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen> {
  String name='';
  String address='';
  String phoneNumber = '';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final databaseReference = FirebaseDatabase.instance.ref();
  late Uint8List image;
  String ImageUrl='';
  var members=1;
  String dropdownValue = list.first;
  bool sucess=false;

  void getImage()async{
    image = await pickImage(ImageSource.gallery);
    setState(() {});
  }

  MyDropDownMenu(){
   return (
       DropdownButton<String>(
     value: dropdownValue,
     icon: const Icon(Icons.arrow_drop_down),
     elevation: 16,
     style:  TextStyle(color: Color(purplehex)),
     onChanged: (String? value) {
       setState(() {
         dropdownValue = value!;
       });
     },
     items: list.map<DropdownMenuItem<String>>((String value) {
       return DropdownMenuItem<String>(
         value: value,
         child: Text(value),
       );
     }).toList(),
   )
   ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primary
        ),
        centerTitle: true,
        title: MyTextStyle(text: Registration_Title,color: primary,),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                      image: AssetImage('Assets/Images/Background.png')
                  )
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xFF7B1FA2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              ),
                              onChanged: (value){
                                setState(() {
                                  name = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Address',
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              ),
                              maxLines: 4,
                              onChanged: (value){
                                setState(() {
                                  address = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Phone',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              ),
                              onChanged: (value){
                                setState(() {
                                  phoneNumber=value;
                                });
                              },
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              getImage();
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 40,
                              width: 310,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(width: 10,),
                                  Text('Upload Aadhar Card',style: TextStyle(color: Colors.black),),
                                  Icon(Icons.download)
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 40,
                            width: 310,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 10,),
                                Text('Family Members',style: TextStyle(color: Colors.black),),
                                InkWell(child: Icon(Icons.remove_circle),onTap: (){
                                  setState(() {
                                    if(members!=1)
                                    members--;
                                  });
                                },),
                                Text(members.toString()),
                                InkWell(child: Icon(Icons.add_circle),onTap: (){
                                  setState(() {
                                    if(members<15)
                                    members++;
                                  });
                                },)
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: Colors.white
                                ),
                                height: 50, width: 310,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('Card Type'),
                                      SizedBox(child: MyDropDownMenu()),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {

                      if(name=='' ||  address=='' || phoneNumber=='')
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No Feild Cant be Empty!!')));
                      }
                      else
                      {
                        databaseReference.child(phoneNumber).set(
                            {
                              "Name" : name,
                              "Address" : address,
                              "Phone" : phoneNumber,
                              "Members": members,
                              "Card-Type" : dropdownValue
                            }
                        );
                        ImageUrl = await StorageMethod().uploadImage('User',image);
                        await _firebaseFirestore.collection('User').doc(phoneNumber).set({
                          "Name" : name,
                          "Address" : address,
                          "Phone" : phoneNumber,
                          "Image Url" : ImageUrl,
                          "Members": members,
                          "Card-Type" : dropdownValue
                        });
                        print('hellpo');
                        sucess=true;
                      }

                      if(sucess)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Registered Wait for Authorization...'),));
                        }
                      Navigator.pop(context);
                    },
                    child: FilledButton(
                      text: 'submit',
                      color: Colors.white,
                      button_color: primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: const BottomNavBar()
    );
  }
}


class FilledButton extends StatelessWidget{
  final String text;
  final Color color;
  final Color button_color;
  VoidCallback? onpress;

  FilledButton(
      {
        required this.text,
        required this.color,
        required this.button_color,
        this.onpress,
        Key? key
      }
      ): super(key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: MyTextStyle(text: text,color: color,fontSize: 16,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: button_color,
      ),
    );
  }
}