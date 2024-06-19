import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('KC Tech'),
        ),
        backgroundColor: Colors.pink,
      ),
        body: Center(
          child: Image.network('https://aebc975c.rocketcdn.me/wp-content/uploads/2020/12/plage.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ),
  ));
}

