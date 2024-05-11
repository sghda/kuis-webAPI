import 'package:flutter/material.dart';
import 'package:kuis/model/cart.dart'; // Import model cart item
import 'package:kuis/services/cart_services.dart';// Import service keranjang belanja

class CartProvider extends ChangeNotifier {
  final String authToken;
  late final CartService cartService; // Tandai cartService sebagai late

  CartProvider(this.authToken) {
    cartService = CartService(authToken); // Inisialisasi cartService di dalam konstruktor
  }

  bool isLoading = false;
  List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;

  Future<void> getCartItems() async {
    isLoading = true;
    notifyListeners();
    
    try {
      _cartItems = await cartService.getCartItems();
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan saat memuat item dari keranjang belanja
    }

    isLoading = false;
    notifyListeners();
  }

  // Menambahkan item ke dalam keranjang belanja
  Future<void> addItemToCart(Cart newItem) async {
    try {
      await cartService.addItemToCart(newItem);
      _cartItems.add(newItem);
      notifyListeners();
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan saat menambahkan item ke dalam keranjang
    }
  }

  // Menghapus item dari keranjang belanja
  Future<void> removeItemFromCart(int itemId) async {
    try {
      await cartService.removeItemFromCart(itemId);
      _cartItems.removeWhere((item) => item.itemId == itemId);
      notifyListeners();
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan saat menghapus item dari keranjang
    }
  }

  // Menghapus semua item dari keranjang belanja
  Future<void> clearCart() async {
    try {
      await cartService.clearCart();
      _cartItems.clear();
      notifyListeners();
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan saat membersihkan keranjang
    }
  }
}

