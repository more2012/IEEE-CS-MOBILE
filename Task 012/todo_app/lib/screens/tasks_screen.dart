import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Cubit/cubit.dart';
import 'package:todo_app/widgets/reusable_widget.dart';
import '../Cubit/states.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required List<Map> tasks,});

  @override
  Widget build(BuildContext context) {
    // using blocBuilder instead of blocConsumer we delete Listener
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return buildListUi(context, tasks: AppCubit.get(context).tasks);
      },
    );
  }
}
