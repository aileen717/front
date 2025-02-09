import 'dart:convert';

import 'package:appkctechast/pages/selectedProduct.dart';
import 'package:flutter/material.dart';
import 'package:appkctechast/services/Product.dart';
import 'package:appkctechast/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future <List<dynamic>> products;
  Future <List<dynamic>> fetchData() async{
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/product/all'));
    final data = jsonDecode(response.body);
    print(data);
    List products = <Product>[];
    for(var product in data){
      products.add(Product.fromJson(product));
    }
    return products;
  }
  @override
  void initState() {
    super.initState();
    products = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Text("Menu",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
          future: products,
          builder: (context, snapshots){
            if(snapshots.connectionState == ConnectionState.waiting){
              return Center(
                child: SpinKitPumpingHeart(
                  color: Colors.pink,
                  size: 60.0,
                ),
              );
            }
            if(snapshots.hasData){
              List products = snapshots.data!;
              return Padding(
                padding: EdgeInsets.all(3.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].productName,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        ),
                        ),
                        Text(products[index].price.toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                        onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SelectedProduct(product: products[index]),
                          )
                        );
                      },
                     ),
                    );
                  }
                ),
              );
            }
            return Center(
              child: Text('Unable to load data'),
            );
          },
        ),
      ),
    );
  }
}
