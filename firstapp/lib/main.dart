import 'package:bloc/bloc.dart';
import 'package:firstapp/layout/shop_layout/shop_layout.dart';
import 'package:firstapp/shared/cubit/cubit.dart';
import 'package:firstapp/shared/cubit/states.dart';
import 'package:firstapp/shared/network/local/cache_helper.dart';
import 'package:firstapp/shared/network/remote/dio_helper.dart';
import 'package:firstapp/shared/styles/themes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/shop_layout/cubit/cubit.dart';
import 'modules/news_app/cubit/cubit.dart';
import 'modules/shop_app/login/shop_login_screen.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'modules/basics_app/home/home_screen.dart';
import 'modules/basics_app/login/login_screen.dart';
import 'modules/basics_app/messenger/messenger_screen.dart';
import 'modules/counter_app/counter/counter_screen.dart';
import 'modules/basics_app/users/users_screen.dart';
import 'modules/bmi_app/bmi/bmi_screen.dart';
import 'modules/bmi_app/bmi_result/bmi_result_screen.dart';
import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardinScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget startWidget;
  MyApp({
    required this.isDark,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // Theme data for light
            theme: lightTheme,
            // Theme data for dark
            darkTheme: darkTheme,
            // Mode which is switch between light and dark
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,

            home: Directionality(
              textDirection: TextDirection.ltr,
              child: startWidget,
            ),
          );
        },
      ),
    );
  }
}
