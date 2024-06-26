import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.pink[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    child: Image.asset('assets/human.png'),
                    radius: 75.0,
                  ),
                ),
    Divider(height: 55.0,
    color: Colors.pink,
    ),
    Row(
      children: [
        Icon(
            Icons.person_2,
            color: Colors.pink,
        ),
        SizedBox(width: 3.0,),
        Text(
        'NAME',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
      ],
    ),
    Text(
      'Aileen Tenorio',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
    SizedBox(height: 30.0,),
    Row(
      children: [
        Icon(Icons.calendar_month,
            color: Colors.pink,
        ),

        SizedBox(width: 3.0,),
        Text(
          'YEAR',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 2.0,
          ),
        ),
      ],
    ),
    Text(
    '$year Year',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    SizedBox(height: 30.0,),
    Row(
      children: [
        Icon(Icons.email,
          color: Colors.pink,
        ),
        SizedBox(width: 3.0,),
        Text(
        'EMAIL',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
      ],
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
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed:(){
            setState(() {
              year +=1 ;
            });
          },
          child: Text('Add Year',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 15.0,
          ),
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.pink,),
          ),
        ),
      ],
    ),
  ],
),
),
);
}
}

