import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Settings Screen",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
