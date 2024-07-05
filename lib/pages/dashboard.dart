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
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Text("Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
       elevation: 3.0,
       onTap: (int val){
         switch (val){
           case 0:
             Navigator.pushNamed(context, '/');
                 break;
           case 1:
             Navigator.pushNamed(context, '/menu');
             break;
           case 2:
             Navigator.pushNamed(context, '/profile');
             break;
         }
       },
        currentIndex: 0,
        selectedItemColor: Colors.indigo[900],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                color: Colors.pink,
              ),
              label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,
              color: Colors.pink,
            ),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
              color: Colors.pink,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
