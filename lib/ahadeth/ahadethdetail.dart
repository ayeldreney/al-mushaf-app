import 'package:flutter/material.dart';
import 'package:islami/ahadeth/ahadeth.dart';

class AhadethDetail extends StatelessWidget {
  static const String routename = "ahadethDetail";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;

    return Stack(
      children: [
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "${args.title}",
              style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
              itemBuilder: (context, index) => Text(
                    "${args.content[index]}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
              separatorBuilder: (context, index) => const Divider(
                    endIndent: 25,
                    indent: 25,
                  ),
              itemCount: args.content.length),
        ),
      ],
    );
  }
}
