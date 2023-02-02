
import 'package:flutter/material.dart';
import 'package:islami/quran/quranpagedetail.dart';


class SurahNameItem extends StatelessWidget {
  String name;
  int index;

  SurahNameItem(this.name,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, QuranPageDetail.routename,arguments:SurahDetailArgs(name,index));
        },
        child: Text("$name",textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline2,));
  }
}


