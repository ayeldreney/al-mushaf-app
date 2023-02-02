import 'package:flutter/material.dart';
import 'package:islami/ahadeth/ahadeth.dart';
import 'package:islami/ahadeth/ahadethdetail.dart';
import 'package:islami/homepage.dart';
import 'package:islami/quran/quranpagedetail.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/settings.dart';
import 'IslamiTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MaterialApp(

    title: 'Localizations Sample App',
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,


    ],

    supportedLocales: [
      Locale('en', ''),
      Locale('ar', ''),
    ],





    debugShowCheckedModeBanner: false,

    initialRoute:HomePage.routename ,
    routes: {
      HomePage.routename:(context) => HomePage(),
      QuranPageDetail.routename:(context) => QuranPageDetail(),
      Ahadeth.routename:(context) =>Ahadeth(),
      AhadethDetail.routename:(context)=>AhadethDetail(),
      SettingsTab.routename:(context) => SettingsTab(),
    },
   theme: IslamiTheme.light,
    themeMode: ThemeMode.light,



  ),);
}
