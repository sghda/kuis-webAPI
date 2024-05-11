import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:kuis/model/item.dart';

class ItemService {
  final String accessToken;

  ItemService(this.accessToken);

  Future<List<Item>> getItems() async {
    final url = 'http://146.190.109.66:8000/items?skip=0&limit=100';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken', // Menambahkan token access_token dalam header Authorization
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final items = json.map((item) {
        return Item(
          title: item['title'],
          description: item['description'],
          price: item['price'],
          img_name: item['img_name'],
          id: item['id'],
        );
      }).toList();
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  // Fungsi untuk mengambil gambar berdasarkan ID item
  Future<Uint8List?> getItemImage(int itemId) async {
    final url = 'http://146.190.109.66:8000/items_image/$itemId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
