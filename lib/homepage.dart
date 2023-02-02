import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:islami/ahadeth/ahadeth.dart';
import 'package:islami/quran/quran.dart';
import 'package:islami/sebha/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/settings.dart';
class HomePage extends StatefulWidget {
  static const String routename = "homepage";


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentindex=0;
  List<Widget> screens=[
    Quran(),
    Sebha(),
    Ahadeth(),
    Quran(),
    SettingsTab(),

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (index){
              currentindex=index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  size:30,
                  AssetImage("assets/images/radio.png"),
                ),
                label: "radio",
                backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  size:30,
                  AssetImage("assets/images/sebha.png"),
                ),
                label: "sebha",
                backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  size:30,
                  AssetImage("assets/images/Group 6.png"),
                ),
                label: "ahadett",
                backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
              ),
              BottomNavigationBarItem(

                icon: ImageIcon(
                  size:30,
                  AssetImage("assets/images/moshaf_blue.png"),
                ),
                label: "quran",
                backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "settings",
                backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
              ),






            ],
          ),


          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle, style: Theme.of(context).textTheme.headline1),
          ),

          body:screens[currentindex],



        ),
      ],
    );
  }
}
