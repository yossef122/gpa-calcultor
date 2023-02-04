import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpacalculator/shared/components/Components.dart';
import 'package:gpacalculator/shared/components/constants.dart';
import 'package:gpacalculator/shared/cubit/appcubit.dart';
import 'package:gpacalculator/shared/cubit/appstate.dart';

class gpascreen extends StatelessWidget {
  const gpascreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, appcStates>(
      listener: (context,state){},

        builder:(context,state)=> GPASCREENBuilde(list)

    );
  }
}
