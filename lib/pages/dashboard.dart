import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

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
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 150.0, 25.0, 0),
        child: Container(
            child: SafeArea(
                child: Column(children: [
          FlutterCarousel(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1),
              showIndicator: true,
              slideIndicator: CircularSlideIndicator(),
            ),
            items: [
              'assets/thumbelina.jpg',
              'assets/snow.jpg',
              'assets/gretel.jpg',
              'assets/bird.jpg',
              'assets/mermaid.jpg',
              'assets/sleeping.jpg',
              'assets/beauty.jpg',
              'assets/cinderella.jpg'
            ].map((String imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ]))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val) {
          switch (val) {
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
            icon: Icon(
              Icons.home,
              color: Colors.pink,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.pink,
            ),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.pink,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
