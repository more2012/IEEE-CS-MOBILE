import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Cubit/cubit.dart';
import 'package:todo_app/Cubit/states.dart';
import 'package:todo_app/screens/add_tasks_screen.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:todo_app/widgets/reusable_widget.dart';
import 'archiev_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
  final _pageController = PageController(initialPage: 0);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        List<Widget> screens = [
          TaskScreen(tasks: cubit.tasks),
          const ArchiveScreen(),
          const DoneScreen(),
        ];

        List<String> titles = [
          '${cubit.tasks.length} Tasks',
          '${cubit.archiveTasks.length} Archived',
          '${cubit.doneTasks.length} Done',
        ];

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
            leading: const Icon(
              Icons.format_list_bulleted,
              color: Colors.white,
            ),
            title: ValueListenableBuilder<int>(
              valueListenable: _valueNotifier,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(
                  titles[value],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: screens,
            onPageChanged: (index) {
              _valueNotifier.value = index;
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (isBottomSheetShow) {
                if (_formKey.currentState!.validate()) {
                  cubit.insertToDatabase(
                    title: _titleController.text,
                    time: _timeController.text,
                    date: _dateController.text,
                    status: "status",
                  ).then((value) {
                    Navigator.pop(context);
                    isBottomSheetShow = false;
                  });
                }
              } else {
                _scaffoldKey.currentState!
                    .showBottomSheet((context) => AddTasksScreen(
                  formKey: _formKey,
                  titleController: _titleController,
                  timeController: _timeController,
                  dateController: _dateController,
                ))
                    .closed
                    .then((value) {
                  isBottomSheetShow = false;
                });
                isBottomSheetShow = true;
              }
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
          bottomNavigationBar: AnimatedNotchBottomBar(
            color: Colors.white,
            notchBottomBarController: _controller,
            elevation: 1,
            showLabel: true,
            removeMargins: false,
            bottomBarWidth: 500,
            showShadow: false,
            durationInMilliSeconds: 300,
            bottomBarItems: [
              bottomBarItem(
                icon: Icons.home,
                text: 'Home',
              ),
              bottomBarItem(
                icon: Icons.archive,
                text: 'Archived',
              ),
              bottomBarItem(
                icon: Icons.check_box,
                text: 'Done',
              ),
            ],
            onTap: (int value) {
              _pageController.jumpToPage(value);
            },
            kIconSize: 25,
            kBottomRadius: 30,
          ),
        );
      },
    );
  }
}
