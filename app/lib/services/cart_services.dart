import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kuis/model/cart.dart';

class CartService {
  final String accessToken;
  final String baseUrl = 'http://146.190.109.66:8000/carts'; // Perbaiki URL di sini

  CartService(this.accessToken);

  Future<List<Cart>> getCartItems() async {
    final url ='http://146.190.109.66:8000/carts' ; // Perbaiki URL di sini
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      final List<Cart> cartItems = jsonList.map((item) {
        return Cart(
          itemId: item['itemId'],
          userId: item['userId'],
          quantity: item['quantity'],
          id: item['id'],
        );
      }).toList();
      return cartItems;
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  Future<void> addItemToCart(Cart newItem) async {
    final url = baseUrl; // Perbaiki URL di sini
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(newItem.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add item to cart');
    }
  }

  Future<void> removeItemFromCart(int itemId) async {
    final url = '$baseUrl/$itemId'; // Perbaiki URL di sini
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove item from cart');
    }
  }

  Future<void> clearCart() async {
    final url = baseUrl; // Perbaiki URL di sini
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to clear cart');
    }
  }
}
