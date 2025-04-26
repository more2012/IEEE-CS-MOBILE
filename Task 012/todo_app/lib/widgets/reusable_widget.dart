import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../Cubit/cubit.dart';

/// bottom bar item
BottomBarItem bottomBarItem({
  required IconData icon,
  required String text}) =>
    BottomBarItem(
      inActiveItem: Icon(icon, color: Colors.black),
      activeItem: Icon(icon, color: Colors.green),
      itemLabelWidget: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );

/// text form field

Widget defaultTextFormField({
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  required GestureTapCallback onTap,
}) => TextFormField(
  controller: controller,
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter task name';
    }
    return null;
  },
  onTap: onTap,
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    prefixIcon: Icon(icon),
    labelText: labelText,
  ),
);

Widget buildListUi(context, {required List<Map> tasks}) {
  return Column(
    children: [
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width * .95,
          height: MediaQuery.of(context).size.height * .778,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .778,
            child: ConditionalBuilder(
                condition: tasks.isNotEmpty,
                builder: (BuildContext context) => ListView.separated(
                    itemBuilder: (context, index) => listItem(
                        donePressed: () {
                          if (tasks[index]['status'] != 'done') {
                            AppCubit.get(context)
                                .updateDatabase('done', tasks[index]['id']);
                          } else {
                            AppCubit.get(context)
                                .updateDatabase('pending', tasks[index]['id']);
                          }
                        }
                        ,
                        deletePressed: () {
                          AppCubit.get(context)
                              .deleteFromDatabase(tasks[index]['id']);
                        },
                        archivePressed: () {
                          if (tasks[index]['status'] == 'archive') {
                            AppCubit.get(context)
                                .updateDatabase('status', tasks[index]['id']);
                          } else {
                            AppCubit.get(context)
                                .updateDatabase('archive', tasks[index]['id']);
                          }
                        },
                        model: tasks[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: tasks.length),
                fallback: (BuildContext context) => const Center(
                  child: Text(
                    'There is no Tasks here',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
          ),
        ),
      ),
    ],
  );
}

//listIcon of CheckBox icon , archived icon , delete icon
Widget listItem(
    {required VoidCallback donePressed,
      required VoidCallback deletePressed,
      required VoidCallback archivePressed,
      required Map model}) {
  return ListTile(
    title: Row(
      children: [
        IconButton(
            onPressed: donePressed,
            icon: Icon(
              model['status'] == 'done'
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            )),
        Expanded(
          child: Text(
            model["title"],
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: archivePressed,
            icon: Icon(
              model['status'] == 'archive'
                  ? Icons.archive
                  : Icons.archive_outlined,
              color: Colors.black,
            )),
        IconButton(
            onPressed: deletePressed,
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            )),
      ],
    ),
    subtitle: Row(
      children: [
        const SizedBox(
          width: 50,
        ),
        Text(
          model["time"],
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          width: 120,
        ),
        Text(
          model["date"],
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    ),
  );
}