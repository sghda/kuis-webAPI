import 'dart:typed_data'; // Perlu untuk menggunakan Uint8List

class Item {
  final String title;
  final String description;
  final int price;
  final String img_name;
  final int id;
  Uint8List? imageBytes; // Properti untuk menyimpan data gambar

  Item({
    required this.title,
    required this.description,
    required this.price,
    required this.img_name,
    required this.id,
  });
}

  // String title = '';
  // String description = '';
  // int price = 0;
  // String image = '';
  // int id = 0;
  // void LogIn(String title, String description, int price, String image, int id) {
  //   this.title = title;
  //   this.description = description;
  //   this.price = price;
  //   this.image = image;
  //   this.id = id;
  //   notifyListeners();
  // }