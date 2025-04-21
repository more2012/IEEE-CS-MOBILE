import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/reusable_widget.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({super.key, required this.formKey, required this.titleController, required this.timeController, required this.dateController});
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController timeController;
  final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            defaultTextFormField(
              controller: titleController,
              labelText: "Task Name",
              icon: Icons.title,
              onTap: () {},
            ),
            const SizedBox(height: 10),
            defaultTextFormField(
              controller: timeController,
              labelText: "Task Time",
              icon: Icons.timer,
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  timeController.text = value!.format(context);
                });
              },
            ),
            const SizedBox(height: 10),
            defaultTextFormField(
              controller: dateController,
              labelText: "Task Date",
              icon: Icons.date_range,
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  lastDate: DateTime.parse('3999-05-09'),
                ).then((value) {
                  dateController.text = DateFormat.yMMMd().format(
                    value!,
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
