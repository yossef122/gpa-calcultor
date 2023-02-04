
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpacalculator/shared/components/constants.dart';
import 'package:gpacalculator/shared/cubit/appstate.dart';
import 'package:sqflite/sqflite.dart';

class appcubit extends Cubit<appcStates>{
  appcubit():super(initialState());
 late Database database;
static appcubit get(context)=>BlocProvider.of(context);
void createdatabase()async {

 database=await openDatabase('Gpacalculate.db',
  version: 1,
  onCreate: (database,version)async{
    await database.execute(
        'CREATE TABLE gpa (Id INTEGER PRIMARY KEY,LETTER TEXT,GRADE TEXT,HOURS TEXT)'
    ).then((value) {
        print("Table created");
    });

  },
    onOpen: (database){
      Getdatafromdb(database);

      print('dataBase opened');

    }
  ).then((value) {
    emit(createdatabaseState());
    return database =value;

  });
}

inserttodatabase(
  {
   required String LETTER ,
    required String GRADE ,
    required String HOURS
  }
    )async{
  database.transaction((txn)async {
    txn.rawInsert('INSERT INTO gpa(LETTER,GRADE,HOURS) VALUES("$LETTER","$GRADE" , "$HOURS")')
        .then((value) {
          list =value as List<Map>;
      print("$value inserted successfully ");
      emit(inserttodatabaseState());
    }).catchError((e)=>print("erroe ${e.toString()} 45 cubit"))

    ;
  });
}

Getdatafromdb(Database database)async{
 list=[];
  await database.rawQuery('SELECT * FROM gpa').then((value) {
    emit(GetdatafromdbState());
value.forEach((element) {
  list.add(element);
});
    print("$value inserted successfully ");

  });
}

deletefromdb(
    @required  int Id

    )async{
  await database
      .rawDelete('DELETE FROM gpa WHERE Id = ?', [Id]).then((value) {
        emit(deletefromdbState());
        Getdatafromdb(database);

  });
}


  void Chdngeindex(int index) {
    index_list = index;
    emit(ChangeNavbarState());
  }


  void ChangeBottomSheet(bool BottomShown, IconData FA) {
    BottomSheetShown = BottomSheetShown;
    FAB = FA;
    emit(ChangeBottomSheeState());
  }
  String ChangeDropLetter(String value) {
    Letter =value;
    emit(ChangeDropLetterState());
    return value;
  }
  String ChangeDropHour(String value) {
    hours =value;
    emit(ChangeDropDownState());
    return value;
  }
}