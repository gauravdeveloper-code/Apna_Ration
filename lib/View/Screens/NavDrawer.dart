import 'package:apna_ration_app/View/Screens/Phone_Screen.dart';
import 'package:flutter/material.dart';
import '../Screens/HelpLinePage.dart';


class NavDrawer extends StatelessWidget {
   const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : SafeArea(
        child: Expanded(
          flex: 1,
          child: ListView(
                 children: [

                   DrawerHeader(
                     child: Image.asset('Assets/Images/drawer_header.png',fit: BoxFit.fitWidth,),
                   ),

                   ListTile(
                     onTap: (){},
                     trailing: const Icon(Icons.info_outline_rounded,color: Colors.purple),
                     title: const Text('About Us',style: TextStyle(color: Colors.purple),),
                   ),
                   const Divider(thickness: 1,),


                   ListTile(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpLine()));
                     },
                     trailing: const Icon(Icons.phone_outlined,color: Colors.purple,),
                     title: const Text('Helpline',style: TextStyle(color: Colors.purple),),
                   ),
                   const Divider(thickness: 1,),



                   ListTile(
                     onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PhoneScreen()));
                     },
                     trailing: const Icon(Icons.logout,color: Colors.purple,),
                     title: const Text('Logout',style: TextStyle(color: Colors.purple),),
                   ),
                   const Divider(thickness: 1,),
                 ],
               ),
        ),
      ),
    );
  }
}
