import 'package:flutter/material.dart';
import 'package:myapp/my_list.dart';



class MyDrawer extends StatelessWidget {
  final void Function()? onVocabPageTap;
  final void Function()? onRealConvTap;
  final void Function()? onPracticeTap;
  final void Function()? onQuizPageTap;
  final void Function()? onChineseCultureTap;
  final void Function()? onSignOut;

  const MyDrawer({super.key,
    required this.onVocabPageTap,
    required this.onRealConvTap,
    required this.onPracticeTap,
    required this.onQuizPageTap,
    required this.onChineseCultureTap,
    required this. onSignOut


  });


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.pink[100],
        child:  Column (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

      Column(children: [
        //header
        const DrawerHeader(
          child : Icon(
            Icons.person,
            color: Colors.white,
            size:100,

          ),

        ),

        //profile list tile
        MyListTile (
          icon: Icons.person,
          text : 'P R O F I L E',
          onTap: onVocabPageTap,
        ),

        //profile list tile
        MyListTile (
          icon: Icons.description,
          text : 'A R D U I N O   L E S S O N S',
          onTap: onRealConvTap,
        ),

        //profile list tile
        MyListTile (
          icon: Icons.description,
          text : 'T I N K E R C A D   L E S S O N S',
          onTap: onPracticeTap,
        ),

        //mini project list tile
        MyListTile (
          icon: Icons.folder,
          text : 'M I N I   P R O J E C T S',
          onTap: onQuizPageTap,
        ),

        //profile list tile
        MyListTile (
          icon: Icons.video_collection,
          text : 'V I D E O   T U T O R I A L',
          onTap: onChineseCultureTap,
        ),

      ],
      ),


      //logout list tile
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: MyListTile(
                icon: Icons.logout,
                text : 'L O G O U T',
                onTap: onSignOut,
              ),
            ),



      ],
    ),
    );

  }
}
