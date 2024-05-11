import 'package:flutter/material.dart';


class CartPageScreen extends StatelessWidget {
  final List<String> cartItems;

  const CartPageScreen({required this.cartItems});
  // const CartPageScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]),
          );
        },
      ),
    );
  }
}
