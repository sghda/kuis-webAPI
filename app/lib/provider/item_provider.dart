import 'package:flutter/material.dart';
import 'package:kuis/model/item.dart';
import 'package:kuis/services/item_services.dart';

class ItemProvider extends ChangeNotifier {
  final String authToken;
  late final ItemService itemService; // Tandai itemService sebagai late

  ItemProvider(this.authToken) {
    itemService = ItemService(authToken); // Inisialisasi itemService di dalam konstruktor
  }

  bool isLoading = false;
  List<Item> _items = [];
  List<Item> get items => _items;

  Future<void> getItems() async {
    isLoading = true;
    notifyListeners();
    
    try {
      _items = await itemService.getItems();
      // Memuat gambar untuk setiap item
      for (var item in _items) {
        item.imageBytes = await itemService.getItemImage(item.id);
      }
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan saat memuat item atau gambar
    }

    isLoading = false;
    notifyListeners();
  }
}
