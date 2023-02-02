

import 'package:flutter/material.dart';

class Provider extends ChangeNotifier{

  String langCode="en";


  void changeLang(String lang){
    if(langCode==lang)return;
    langCode=lang;
  notifyListeners();
  }


}