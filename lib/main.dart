import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.pink[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'NAME',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Aileen Tenorio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              'YEAR',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '4th',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              'EMAIL',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'tenorioaileen07@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}

