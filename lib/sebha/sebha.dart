import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {


  int tasbehha = 0;
  List<String> items = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
  ];
int index=0;



  String? value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  child: Center(
                    child: Container(

                        width: 250,
                        height: 250,
                        child: Image.asset("assets/images/Group 8.png",)),
                  ),
              onTap: (){
                if((tasbehha+1)%33==0){
                tasbehha=-1;
                  index++;
                 value=items[index];




                }

                    tasbehha++;


                setState(() {

                });
              },),
              Text("عدد التسبيحات",
                  style: Theme.of(context).textTheme.headline1),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "${tasbehha}",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 30),
                ),
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(183, 147, 95, 10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(183, 147, 95, 10),
                ),
                child: DropdownButton(



                      iconSize: 34,
                  iconEnabledColor: Colors.black,
                  style: TextStyle(
                   color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  value: value,
                  items: items.map(buildMenuItem).toList(),
                onChanged: (value)=>setState(() =>this.value=value),

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String e) => DropdownMenuItem(
        value: e,
        child: Text(

          e,
        ),
      );
}
