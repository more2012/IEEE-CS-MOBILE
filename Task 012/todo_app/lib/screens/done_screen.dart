import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Cubit/cubit.dart';
import 'package:todo_app/widgets/reusable_widget.dart';
import '../Cubit/states.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) =>
            buildListUi(context, tasks: AppCubit.get(context).doneTasks),
        listener: (context, state) {});
  }
}