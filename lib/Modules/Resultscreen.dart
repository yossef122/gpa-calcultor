import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpacalculator/Modules/Result2_Screen.dart';
import 'package:gpacalculator/shared/components/constants.dart';

class resultscreen extends StatefulWidget {
   resultscreen({Key? key}) : super(key: key);

  @override
  State<resultscreen> createState() => _resultscreenState();
}

class _resultscreenState extends State<resultscreen> {
  // Map gpaList =list as Map;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
      ElevatedButton(child: Text('Calculate'),
          onPressed: (){

      for(int i=0 ;i<list.length ;i++) {
        setState(() {
          calcHour+=num.parse(list[i]['HOURS']);
          if (list[i]['LETTER'] == 'A') {
            gpacalc += num.parse(list[i]['HOURS'])  * 4;
          }
          else if (list[i]['LETTER'] == 'A-') {
            gpacalc +=  num.parse(list[i]['HOURS']) * 3.666;
          }
          else if (list[i]['LETTER'] == 'B+') {
            gpacalc += num.parse(list[i]['HOURS']) * 3.333;
          }
          else if (list[i]['LETTER'] == 'B') {
            gpacalc += double.parse(list[i]['HOURS']) * 3.000;
          }
          else if (list[i]['LETTER'] == 'B-') {
            gpacalc +=  double.parse(list[i]['HOURS']) * 2.666;
          }
          else if (list[i]['LETTER'] == 'C+') {
            gpacalc += double.parse(list[i]['HOURS']) * 2.333;
          }
          else if (list[i]['LETTER'] == 'C') {
              gpacalc +=   double.parse(list[i]['HOURS']) * 2.000;
          }
          else if (list[i]['LETTER'] == 'C-') {
            gpacalc +=  double.parse(list[i]['HOURS']) * 1.666;
          }
          else if (list[i]['LETTER'] == 'D+') {
            gpacalc+= double.parse(list[i]['HOURS']) * 1.333;
          }
          else if (list[i]['LETTER'] == 'D') {
            gpacalc+=  double.parse(list[i]['HOURS']) * 1.000;
          }
        });
      }
      Navigator.push(context, MaterialPageRoute(builder:(context)=> ResultScreen()));
      calcresult =gpacalc /calcHour;
          print("Gpa = $calcresult");
          },
          style:
                ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black)
      )
      )
        ],
      ),
    );
  }
  double getGpa(){
    return calcresult;
  }
}
