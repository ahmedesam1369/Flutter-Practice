import 'package:firstapp/modules/shop_app/login/shop_login_screen.dart';
import 'package:firstapp/shared/component/components.dart';
import 'package:firstapp/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

var defaultColor = Colors.blue;
// API used Links
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// API Search
// https://newsapi.org/v2/everything?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    navigateAndFinish(context, ShopLoginScreen());
  });
}
