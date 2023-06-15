import 'package:flutter/material.dart';


class HelpLine extends StatelessWidget {
   HelpLine({Key? key}) : super(key: key);

  final List TollNo = [18004252977,18003433197,03602244290,18003453611,18003456194,18001802068,18002333663,18002334004,02602230607,1800110841,
    18002330022,18002335500,18001802087,18001808026,18001807011,18003456598,18004259339,18004251550,4253186,07552441675,
    1800224950,18003453821,18003453670,18003453891,18003453704, 18003453705,18003456724,18004251082,180030061313,
    18001806127,18003453236,18004255901,180042500333,18003453665,18001800150,18001804188,18003455505];

  final List States = ['Andhra Pradesh','Andaman & Nicobar Islands','Arunachal Pradesh','Assam','Bihar','Chandigarh','Chhattisgarh'
  ,'Dadra & Nagar Haveli','Daman & Diu','Delhi','Goa','Gujarat','Haryana','Himachal Pradesh','Jammu & Kashmir','Jharkhand','Karnataka',
  'Kerala','Lakshadweep','Madhya Pradesh','Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Puducherry','Punjab','Rajasthan'
  ,'Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(child: ListTile(
                leading: Text('S.No'),
                title: Center(child: Text('State/UT'),),
                trailing: Text('Toll Number'),
              ),alignment: Alignment.center,color: Colors.black12,),
              
              Container(
               height: MediaQuery.of(context).size.height,
               width: double.infinity,
               margin: EdgeInsets.only(bottom: 10),
               padding: EdgeInsets.only(bottom: 10),
               child:  ListView.builder(
                   itemCount: 29,
                   itemBuilder: (BuildContext context, int index) {
                     return ListTile(
                         leading: Text((index+1).toString()),
                         title: Text(States[index].toString()),
                         trailing: InkWell(
                           onTap: (){
                           },
                           child: Text(TollNo[index].toString(), style: TextStyle(color: Colors.purple[700]),
                           ),
                         ),
                     );
                   }),
             ),
            ],
          ),
      ),
    );
  }
}
