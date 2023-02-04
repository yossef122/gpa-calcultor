import 'package:flutter/material.dart';

int index_list =0;
int length_list =list.length;
var Scaffoldkey =GlobalKey<ScaffoldState>();
var Formkey =GlobalKey<FormState>();
bool BottomSheetShown =false;
String selectedGpa ="A";
IconData FAB =Icons.edit;
var Gradecontroller =TextEditingController();
 var Letter="A" ;
 var hours="3" ;
List<Map> list=[];
late  double calcHour=0;
late double gpacalc=0;

late double calcresult =0;

