import 'package:firstapp/models/users/users_model.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 7, name: 'ESAM', phone: '1369'),
    UserModel(id: 7, name: 'hawa', phone: '1011'),
    UserModel(
      id: 2,
      name: 'ahmed',
      phone: '789',
    ),
    UserModel(
      id: 77,
      name: 'mahmoud',
      phone: '1789',
    ),
    UserModel(id: 7, name: 'ESAM', phone: '1369'),
    UserModel(id: 7, name: 'hawa', phone: '1011'),
    UserModel(
      id: 2,
      name: 'ahmed',
      phone: '789',
    ),
    UserModel(
      id: 77,
      name: 'mahmoud',
      phone: '1789',
    ),
    UserModel(id: 7, name: 'ESAM', phone: '1369'),
    UserModel(id: 7, name: 'hawa', phone: '1011'),
    UserModel(
      id: 2,
      name: 'ahmed',
      phone: '789',
    ),
    UserModel(
      id: 77,
      name: 'mahmoud',
      phone: '1789',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (Context, index) => buildUserItem(users[index]),
        separatorBuilder: (Context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
            end: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
