import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpacalculator/layout/appscreen.dart';
import 'package:gpacalculator/shared/bloc_observe/HomeScreen.dart';

import 'shared/bloc_observe/bloc_observe.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AppHomePage2(),
    );
  }
}
