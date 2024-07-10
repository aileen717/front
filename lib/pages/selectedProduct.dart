import 'package:appkctechast/services/Product.dart';
import 'package:flutter/material.dart';

class SelectedProduct extends StatefulWidget {
  final Product product;
  const SelectedProduct({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState(product: product);
}

class _SelectedProductState extends State<SelectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;
  _SelectedProductState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text(
          'Order',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(widget.product.productName,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(widget.product.description,
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '₱ ${totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(numberOfOrders > 1){
                          numberOfOrders -= 1;
                          totalAmount = product.price * numberOfOrders;
                          }
                        });
                    },
                        icon: Icon(Icons.remove,
                          size: 18.0,
                        ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.pink[100])
                      ),
                    ),
                    Text(
                      numberOfOrders.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                        numberOfOrders += 1;
                        totalAmount = product.price * numberOfOrders;
                      });
                    },
                        icon: Icon(Icons.add,
                          size: 18.0,
                        ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.pink[100])
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
