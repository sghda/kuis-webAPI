import 'package:flutter/material.dart';
import 'package:kuis/model/cart.dart';

class CartPageScreen extends StatelessWidget {
  final List<Cart> cartItems;

  const CartPageScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.itemId.toString()),
            subtitle: Text(cartItem.quantity.toString()),
          );
        },
      ),
    );
  }
}
