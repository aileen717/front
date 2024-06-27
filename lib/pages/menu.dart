import 'package:appkctechast/services/product.dart';
import 'package:flutter/material.dart';
import 'package:appkctechast/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "The Giver", price: 299.99),
    Product(productName: "No Longer Human", price: 299.99),
    Product(productName: "Cirque", price: 299.99),
    Product(productName: "Harry Potter", price: 299.99),
    Product(productName: "Hunger Games", price: 299.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Text("Menu"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      )
    );
  }
}
