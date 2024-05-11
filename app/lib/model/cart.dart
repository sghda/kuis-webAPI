class Cart {
  final String itemId;
  final String userId;
  final String quantity;
  final String id;

  Cart({
    required this.itemId,
    required this.userId,
    required this.quantity,
    required this.id,
  });


  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'userId': userId,
      'quantity': quantity,
      'id': id,
    };
  }

    factory Cart.fromJson(Map<String, dynamic> json) {
    final itemId = json['itemId'].toString();
    final userId = json['userId'].toString();
    final quantity = json['quantity'].toString();
    final id = json['id'].toString();
    
    return Cart(
      itemId: itemId,
      userId: userId,
      quantity: quantity,
      id: id,
    );
  }
}
