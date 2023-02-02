import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ahadeth/ahadethdetail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Ahadeth extends StatefulWidget {
  static const String routename = "ahadeth";

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<HadethData> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadfile();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/ahadethimage.png"),
        const Divider(
          color: Color.fromRGBO(183, 147, 95, 1.0),
          thickness: 2,
          indent: 25,
          endIndent: 25,
        ),
        Text(AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center),
        const Divider(
          color: Color.fromRGBO(183, 147, 95, 1.0),
          thickness: 2,
          indent: 25,
          endIndent: 25,
        ),
        ahadeth.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.separated(
                    itemCount: ahadeth.length,
                    separatorBuilder: (context, index) => Divider(
                          indent: 25,
                          endIndent: 25,
                        ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, AhadethDetail.routename
                        ,arguments: ahadeth[index],
                        );
                      },

                      child: Text(
                            "${ahadeth[index].title}",
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center,
                          ),
                    )),
              ),
      ],
    );
  }

  void loadfile() async {
    String content = await rootBundle.loadString("assets/files/ahadeth_.txt");

    List<String> allAhadeth = content.trim().split("#\r\n");

    for (int i = 0; i < allAhadeth.length; i++) {
      String hadeth = allAhadeth[i];
      List<String> hadethLines = hadeth.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      ahadeth.add(hadethData);
    }

    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;
  HadethData(this.title, this.content);
}
