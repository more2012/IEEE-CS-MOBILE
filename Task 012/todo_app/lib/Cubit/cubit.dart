// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:todo_app/Cubit/states.dart';
//
// import '../screens/archiev_screen.dart';
// import '../screens/done_screen.dart';
// import '../screens/tasks_screen.dart';
//
// class AppCubit extends Cubit<AppStates>{
//   AppCubit():super(AppInitialState());
//   static AppCubit get (context) => BlocProvider.of(context);
//
//
//   bool isBottomSheetShow = false;
//   List<Map> tasks = [];
//   List<Map> doneTasks = [];
//   List<Map> archiveTasks = [];
//
//   List<Widget> get screens => [
//     TaskScreen(tasks: tasks),
//     const ArchiveScreen(),
//     const DoneScreen(),
//   ];
//   late Database database;
//   void createDatabase() async {
//     // why async
//     database = await openDatabase('path.db', version: 1,
//         onCreate: (database, version) {
//           database.execute(
//               'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)');
//         }, onOpen: (database) {
//           getDataFromDatabase(database);
//         });
//   }
//
//   /// inset to database
//   insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//     required String status,
//   }) async {
//     await database.transaction((txn) {
//       return txn
//           .rawInsert(
//           'INSERT INTO tasks (title, time, date, status) VALUES("$title", "$time", "$date" , "$status")')
//           .then((value) {
//         getDataFromDatabase(database);
//         emit(AppInsertDatabaseSuccessState());
//       }).catchError((error) {
//         emit(AppInsertDatabaseErrorState(error.toString()));
//       });
//     });
//   }
//
//   /// get data from database
//   void getDataFromDatabase(database) async {
//     tasks.clear();
//     doneTasks.clear();
//     archiveTasks.clear();
//     await database.rawQuery('SELECT * FROM tasks').then((value) {
//       value.forEach((e) {
//         if (e['status'] == 'status') {
//           doneTasks.add(e);
//         } else if (e['status'] == 'archive') {
//           archiveTasks.add(e);
//         } else {
//           tasks.add(e);
//         }
//       });
//     });
//     emit(AppGetDatabaseSuccessState());
//   }
//
//   /// delete data from database
//   void deleteFromDateBase(int id) async {
//     await database
//         .rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
//       getDataFromDatabase(database);
//     });
//   }
//
//   /// update data in database
//   void updateDatabase(String status, int id) async {
//     await database.rawUpdate(
//         'UPDATE tasks SET status = ? WHERE id = ?',
//         [status, id]).then((value) {
//       getDataFromDatabase(database);
//     });
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Cubit/states.dart';
import '../screens/archiev_screen.dart';
import '../screens/done_screen.dart';
import '../screens/tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isBottomSheetShow = false;
  List<Map> tasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  List<Widget> get screens => [
    TaskScreen(tasks: tasks),
    const ArchiveScreen(),
    const DoneScreen(),
  ];

  late Database database;

  void createDatabase() async {
    database = await openDatabase('tasks.db', version: 1,
        onCreate: (database, version) {
          database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)');
        }, onOpen: (database) {
          getDataFromDatabase(database);
        });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
    required String status,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO tasks (title, time, date, status) VALUES("$title", "$time", "$date", "$status")')
          .then((value) {
        getDataFromDatabase(database);
        emit(AppInsertDatabaseSuccessState());
      }).catchError((error) {
        emit(AppInsertDatabaseErrorState(error.toString()));
      });
    });
  }

  void getDataFromDatabase(database) async {
    tasks.clear();
    doneTasks.clear();
    archiveTasks.clear();

    await database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((e) {
        if (e['status'] == 'done') {
          doneTasks.add(e);
        } else if (e['status'] == 'archive') {
          archiveTasks.add(e);
        } else if (e['status'] == 'status') {
          tasks.add(e);
        }
      });
    });
    emit(AppGetDatabaseSuccessState());
  }

  void deleteFromDatabase(int id) async {
    await database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
    });
  }

  void updateDatabase(String status, int id) async {
    await database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getDataFromDatabase(database);
    });
  }
}
