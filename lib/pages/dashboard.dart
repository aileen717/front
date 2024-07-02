import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/menu');
                },
                child: Text('Go to Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.pink,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text("Go to Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.pink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
