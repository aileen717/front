import 'package:appkctechast/home.dart';
import 'package:appkctechast/pages/dashboard.dart';
import 'package:appkctechast/pages/menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   routes: {
       '/' : (context) => Dashboard(),
       '/menu' : (context) => Menu(),
       '/profile' : (context) => Home(),
   },
));
