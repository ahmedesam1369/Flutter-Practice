import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({
    @required this.id = 10,
    @required this.name = 'esam',
    @required this.phone = '010',
  });
}
