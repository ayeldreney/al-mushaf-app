
import 'package:flutter/material.dart';
import 'package:islami/quran/quranpagedetail.dart';
import 'package:islami/quran/surahnameitem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class Quran extends StatelessWidget {


  List<String> surahnames=[
  "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
child: SingleChildScrollView(
  child:   Column(

    children: [
      Image.asset("assets/images/Screenshot (1).png"),

      const Divider(
        color: Color.fromRGBO(183, 147, 95, 1.0),
        thickness: 2,
        indent: 25,
        endIndent: 25,
      ),
      Text(AppLocalizations.of(context)!.surah_names,style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center),
      const Divider(
        color: Color.fromRGBO(183, 147, 95, 1.0),
        thickness: 2,
        indent: 25,
        endIndent: 25,
      ),

      ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => SurahNameItem(surahnames[index],index), separatorBuilder: (context, index) =>

          const Divider(color:Colors.black,
          endIndent: 25,
          indent: 25,),

           itemCount:surahnames.length

      ),


    ],
  ),
),
    );
  }
}





