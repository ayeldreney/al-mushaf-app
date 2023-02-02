import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/quran.dart';
import 'package:islami/quran/surahnameitem.dart';

class QuranPageDetail extends StatefulWidget {
  static const String routename = "quranpagedetail";

  @override
  State<QuranPageDetail> createState() => _QuranPageDetailState();
}

class _QuranPageDetailState extends State<QuranPageDetail> {
  List<String> versers = [];

  @override
  Widget build(BuildContext context) {
    SurahDetailArgs args =
        ModalRoute.of(context)?.settings.arguments as SurahDetailArgs;
    if (versers.isEmpty) {
      loadfile(args.index);
    }

    return Stack(
      children: [
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("${args.name}",
                style: Theme.of(context).textTheme.headline1),
          ),
          body: versers.length == 0
              ? Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(248, 248, 248, 100),
            ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(255, 255, 255, 10),

            ),
              margin: EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: versers.length,
                    itemBuilder: (context, index) => Text(versers[index],
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                          wordSpacing: 25,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      endIndent: 25,
                      indent: 25,
                    ),
                  ),
              ),
        ),
      ],
    );
  }

  void loadfile(int index) async {
    String response =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> ayat = response.split("\n");


    versers = ayat;


    setState(() {});
  }
}

class SurahDetailArgs {
  String name;
  int index;
  SurahDetailArgs(this.name, this.index);
}
