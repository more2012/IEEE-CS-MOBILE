import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/screens/add_tasks_screen.dart';
import 'package:todo_app/screens/archiev_screen.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import '../widgets/reusable_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

///create database
///create table
///open database
///insert to database
///get from database
///update in database
///delete from database

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;

  List<Widget> get screens => [
    TasksScreen(tasks: tasks),
    const ArchievScreen(),
    const DoneScreen(),
  ];
  late Database database;
  List<Map> tasks = [];
  void createDatabase() async {
    // why async
    database = await openDatabase(
      'path.db',
      version: 1,
      onCreate: (database, version) async {
        print("dataBase Created");
        await database.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT,time Text, date Text,status Text )',
        );
        print("table Created");
      },
      onOpen: (database) async {
        await getDateFromDatabase(database).then((value) {
          tasks = value;
        });
        ///////////////////////////////////
      },
    );
  }

  Future insertToDatebase({
    required String title,
    required String date,
    required String time,
    required String status,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
            'INSERT INTO Tasks(title, time, date, status) VALUES("$title", "$date", "$time","$status")',
          )
          .then((value) {
            getDateFromDatabase(database).then((value) {
              tasks = value;
            });
          });
    });
  }

  Future<List<Map>> getDateFromDatabase(database) async {
    setState(() {});
    return await database.rawQuery('SELECT * FROM Tasks');
  }

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

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
        onPressed: () async {
          if (isBottomSheetShow) {
            if (formKey.currentState!.validate()) {
              await insertToDatebase(
                title: titleController.text,
                date: dateController.text,
                time: timeController.text,
                status: 'status',
              ).then((value) {
                setState(() {});
                Navigator.pop(context);
                isBottomSheetShow = false;
              });
            }
          } else {
            _scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => AddTasksScreen(
                    formKey: formKey,
                    titleController: titleController,
                    timeController: timeController,
                    dateController: dateController,
                  ),
                )
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
