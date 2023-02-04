import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpacalculator/Modules/Gpascreen.dart';
import 'package:gpacalculator/Modules/Resultscreen.dart';
import 'package:gpacalculator/shared/components/Components.dart';
import 'package:gpacalculator/shared/components/constants.dart';
import 'package:gpacalculator/shared/cubit/appcubit.dart';
import 'package:gpacalculator/shared/cubit/appstate.dart';

class AppHomePage2 extends StatefulWidget {
  const AppHomePage2({Key? key}) : super(key: key);

  @override
  State<AppHomePage2> createState() => _AppHomePageState2();
}

class _AppHomePageState2 extends State<AppHomePage2> {
  List screens=[
    gpascreen(),
    resultscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => appcubit()..createdatabase(),
      child: BlocConsumer<appcubit, appcStates>(
        listener: (context, state) {
          if(state is inserttodatabaseState){
            Navigator.pop(context);
          }

        },
        builder: (context, state) => Scaffold(
            key: Scaffoldkey,
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: const Text(
                "GpaCalculator",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              actions: const [Icon(Icons.calculate)],
            ),
            body:screens[index_list] ,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (BottomSheetShown) {
                  if (Formkey.currentState!.validate()) {
                    appcubit
                        .get(context)
                        .inserttodatabase(
                            LETTER: Letter,
                            GRADE: Gradecontroller.text,
                            HOURS: hours)
                        .then((vaue) {
                      appcubit
                          .get(context)
                          .Getdatafromdb(appcubit.get(context).database);
                      appcubit
                          .get(context)
                          .ChangeBottomSheet(false, Icons.edit);
                    });
                  }
                } else {
                  Scaffoldkey.currentState!
                      .showBottomSheet((context) {
                        return Form(
                          key: Formkey,
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextformfirldBuilder(
                                    labelText: "Course name",
                                    controller: Gradecontroller,
                                    keyboard: TextInputType.text,
                                    ValidateFunction: (value) {
                                      if (value!.isEmpty) {
                                        return "Title mustn't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                                //   child: DropBoxForm(
                                //     leadingtext: "Letter Greade",
                                //     listButton: [
                                //       "A",
                                //       "A-",
                                //       "B+",
                                //       "B",
                                //       "B-",
                                //       "C+",
                                //       "C",
                                //       "C-",
                                //       "D+",
                                //       "D"
                                //     ],
                                //     selected: 'A',
                                //     width: 145,
                                //     letter1 :Letter,
                                //
                                //   ),
                                // ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Letter Grade",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        SizedBox(width: 20),
                                        DropdownButton(
                                          items: [
                                            "A",
                                            "A-",
                                            "B+",
                                            "B",
                                            "B-",
                                            "C+",
                                            "C",
                                            "C-",
                                            "D+",
                                            "D"
                                          ]
                                              .map((e) => DropdownMenuItem(
                                                    child: Text("$e"),
                                                    value: e,
                                                  ))
                                              .toList(),
                                          onChanged: (String? value) {
                                            appcubit
                                                .get(context)
                                                .ChangeDropLetter(value!);
                                          },
                                          value: Letter,
                                          iconSize: 30,
                                          autofocus: true,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 20),
                                //   child: DropBoxForm(
                                //     leadingtext: "credit course hour",
                                //     listButton: ["3", "2", "1"],
                                //     selected: '3',
                                //     width: 105.0,
                                //     letter1: hours,
                                //   ),
                                // )
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "credit course hour",
                                          style:  TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        SizedBox(width: 20.0),
                                        DropdownButton(
                                         items: ["3", "2", "1"]
                                              .map((e) => DropdownMenuItem(
                                            child: Text("$e"),
                                            value: e,
                                          ))
                                              .toList(),
                                          onChanged: (String? value) {
                                            appcubit
                                                .get(context)
                                                .ChangeDropHour(value!);
                                          },
                                          value: hours,
                                          iconSize: 30,
                                          autofocus: true,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                      .closed
                      .then((value) {
                        appcubit
                            .get(context)
                            .ChangeBottomSheet(false, Icons.edit);
                        BottomSheetShown = false;
                        FAB = Icons.edit;
                      });
                  appcubit.get(context).ChangeBottomSheet(true, Icons.add);
                  BottomSheetShown = true;
                  FAB = Icons.add;
                }
              },
              child: Icon(FAB),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.purple,
              type: BottomNavigationBarType.fixed,
              items:  const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.calculate_outlined),
                    label: 'Gpa',
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done_outline),
                    label: ' Result  ',
                    backgroundColor: Colors.blue),
              ],
              currentIndex: index_list,
              onTap: (index) {
                setState(() {
                  // AppCubit.get(context).Chdngeindex(index);
                  index_list = index;
                });
              },
            )),
      ),
    );
  }
}
