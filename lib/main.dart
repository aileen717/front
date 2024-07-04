import 'package:appkctechast/pages/login.dart';
import 'package:appkctechast/pages/signup.dart';
import 'package:appkctechast/home.dart';
import 'package:appkctechast/pages/dashboard.dart';
import 'package:appkctechast/pages/menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
   routes: {
       '/' : (context) => Dashboard(),
       '/menu' : (context) => Menu(),
       '/profile' : (context) => Home(),
       '/signup' : (context) => Signup(),
       '/login' : (context) => Login(),
   },
));
