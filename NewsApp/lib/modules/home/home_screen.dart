import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,

          leading: Icon(
            Icons.menu,
          ),

          title: Text('First App'),

          actions: [
            IconButton(
              icon: Icon(
                Icons.notification_important,
              ),
              onPressed: () {
                print("Notification pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Icon Search');
              },
            ),
            IconButton(
              icon: Text('Hello'),
              onPressed: () {
                print('Hello');
              },
            ),
          ],

          centerTitle: true,
          elevation: 20, // Shadow below App Bar
        ),
        body: Column(
          children: [
            Container(
              width: 200.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg'),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        // horizontal: 10.0,
                      ),
                      child: Text(
                        'Flower',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
