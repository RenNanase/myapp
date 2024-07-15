import 'package:flutter/material.dart';
import 'package:myapp/my_list.dart';



class MyDrawer extends StatelessWidget {
  final void Function()? onVocabularyTap;
  final void Function()? onQuizPageTap;
  final void Function()? onMiniGamesTap;
  final void Function()? onInfographicTap;
  final void Function()? onSignOut;

  const MyDrawer({super.key,
    required this.onVocabularyTap,
    required this.onQuizPageTap,
    required this.onMiniGamesTap,
    required this.onInfographicTap,
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
          icon: Icons.book,
          text : 'V O C A B U L A R Y',
          onTap: onVocabularyTap,
        ),

        //mini project list tile
        MyListTile (
          icon: Icons.quiz,
          text : 'Q U I Z',
          onTap: onQuizPageTap,
        ),

        //mini games
        MyListTile (
          icon: Icons.videogame_asset_sharp,
          text : 'M I N I  G A M E S',
          onTap: onMiniGamesTap,
        ),

        //infographic
        MyListTile (
          icon: Icons.image,
          text : 'I N F O G R A P H I C',
          onTap: onInfographicTap,
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
