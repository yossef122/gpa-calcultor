import 'package:flutter/material.dart';
import 'package:gpacalculator/Modules/Resultscreen.dart';
import 'package:gpacalculator/shared/components/constants.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Result Screen",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gpa : ${calcresult}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
