import 'package:bloc/bloc.dart';
import 'package:firstapp/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:firstapp/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:firstapp/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:firstapp/shared/cubit/states.dart';
import 'package:firstapp/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }

  late Database database;
  List<Map> tasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print('database created');
        await database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT )')
            .then((value) {
          print('Table Created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('database Opened');
        getDataFromDatabase(database).then((value) {
          tasks = value;
          // print(tasks);
          emit(AppGetDataBaseState());
        });
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")')
          .then((value) {
        print('$value Inserted Succefully');
        emit(AppInsertDataBaseState());
        getDataFromDatabase(database).then((value) {
          tasks = value;
          // print(tasks);
          emit(AppGetDataBaseState());
        });
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    emit(AppGetDataBaseLoadingState());

    return await database.rawQuery('SELECT * FROM tasks');
  }

  void updateData({
    String? status,
    int? id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id =?',
      [status, id],
    ).then((value) => {emit(UpdateDataBaseState())});
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
