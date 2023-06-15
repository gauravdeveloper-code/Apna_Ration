import 'package:flutter/material.dart';
import '../Widgets/TextStyle.dart';

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return(
        const BottomAppBar(
         color: Colors.white,
         child: SizedBox(
           height: 35,
           child: Center(
               child: MyTextStyle(
                 text: 'One Nation One Ration Card',color: Colors.purple,)
           ),
         ),
        )
    );
  }
}