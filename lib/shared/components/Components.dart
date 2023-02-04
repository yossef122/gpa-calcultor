import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpacalculator/shared/components/constants.dart';
import 'package:gpacalculator/shared/cubit/appcubit.dart';
// import 'package:gpacalculator/shared/components/constants.dart';
// import 'package:gpacalculator/shared/cubit/appcubit.dart';

Widget TextformfirldBuilder({
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  required TextEditingController controller,
  required TextInputType keyboard,
  required ValidateFunction,
}) =>
    TextFormField(
      decoration: InputDecoration(
        label: Text("$labelText"),
        labelStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
      keyboardType: keyboard,
      controller: controller,
      validator: ValidateFunction,
    );

Widget BuildDegreeForm(Map list,context) {
  return Dismissible(
    key: Key(list['Id'].toString()),
    onDismissed:(directrion){
      appcubit.get(context).deletefromdb(list['Id']);
    },
    child: SingleChildScrollView(
      scrollDirection:Axis.horizontal ,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.blue,
              child: Row(
                children:  [
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(
                    "${list['LETTER']}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    height:10 ,
                  ),
              Text("Course Name : ${list['GRADE']}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Credit Hours   : ${list['HOURS']} ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(onPressed: (){
                    appcubit.get(context).deletefromdb(list['Id']);
                  }, icon: Icon(Icons.dangerous_outlined,color: Colors.blue,size: 35,))
                ],
              ),
            ])
          ],
        ),
      ),
    ),
  );
}

Widget DropBoxForm({
  required String leadingtext,
  required List<String> listButton,
  TimelineAsyncFunction? OnchangeFunction,
  required String selected,
  required String letter1,

  required double width,
}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.grey),
      child: Row(
        children: [
          Text(
            "$leadingtext",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(width: width),
          DropdownButton(
            items: listButton
                .map((e) => DropdownMenuItem(
                      child: Text("$e"),
                      value: e,
                    ))
                .toList(),
            onChanged: (String? value )
            {
              // selected =value!;
              // letter1 =value!;

            }

            ,
            value: selected,
              iconSize :30,
            autofocus: true,

          )
        ],
      ),
    );



Widget GPASCREENBuilde (List task)=>ListView.separated(
  itemBuilder: (context, index) => task.isNotEmpty ?BuildDegreeForm(task[index],context): Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:const [
      Icon(Icons.menu ,size: 100,color: CupertinoColors.systemGrey2,),
      Text("No item in data base ,please add some taks ",style: TextStyle(color: CupertinoColors.systemGrey2 ,fontSize: 15,fontWeight: FontWeight.bold ),)
    ],
  )),
  separatorBuilder: (context, index) =>/*ListViewSeperate(task.length),*/
  Container(
    height: 1.0,
    width: double.infinity,
    color: Colors.grey,
  ),
  itemCount: task.length,

);

Widget ListViewSeperate(int length){
  if(length>2)
    {
      return Container(
        child: Column(
          children: [
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            OutlinedButton(onPressed: (){}, child: Text("Calculate"),)
          ],
        ),

      );
    }
  else{
    return Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey,
    );
  }
}