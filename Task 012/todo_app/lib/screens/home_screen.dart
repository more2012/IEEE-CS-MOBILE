import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/archiev_screen.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import '../widgets/reusable_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _pageController = PageController(initialPage: 0);
final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
final _scaffoldKey = GlobalKey<ScaffoldState>();
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isBottomSheetShow = false;

List<Widget> screens = const [TasksScreen(), ArchievScreen(), DoneScreen()];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
        title: Row(
          children: [
            Icon(Icons.format_list_bulleted, color: Colors.white),
            Text(
              " All Tasks",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(screens.length, (index) => screens[index]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShow) {
            if (formKey.currentState!.validate()) {
              Navigator.pop(context);
              isBottomSheetShow = false;
            }
          } else {
            _scaffoldKey.currentState!
                .showBottomSheet((context) {
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
                })
                .closed
                .then((value) {
                  isBottomSheetShow = false;
                });
            isBottomSheetShow = true;
          }
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.green),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        showLabel: true,
        notchColor: Colors.black,
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,
        //elevation:5,
        bottomBarItems: [
          bottomBarItem(icon: Icons.home, text: 'Home'),
          bottomBarItem(icon: Icons.archive, text: 'Archived'),
          bottomBarItem(icon: Icons.check_box, text: 'Done'),
        ],
        onTap: (value) {
          _pageController.jumpToPage(value);
        },
        kIconSize: 24,
        kBottomRadius: 28,
      ),
    );
  }
}
