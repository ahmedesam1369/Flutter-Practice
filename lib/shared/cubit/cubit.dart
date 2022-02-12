import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/shared/cubit/states.dart';
import 'package:fristapp/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntailState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void ChangeIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  bool isBottomSheetShown = false;
  bool isiconadd = true;

  void ChangeBottomSheetState({
    required bool isiconadd,
  }) {
    isBottomSheetShown = isiconadd;
    emit(AppChangeBottomSheetState());
  }

  bool IsDark = false;
  void ChangeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      IsDark = fromShared;
    } else
      IsDark = !IsDark;

    CachHelper.saveData(key: 'isDark', value: IsDark).then((value) {
      emit(AppChangeModeState());
    });
  }
}
