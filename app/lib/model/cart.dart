class Cart {
  final int itemId;
  final int userId;
  int quantity;
  final int id;

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
    final itemId = json['itemId'] as int;
    final userId = json['userId'] as int;
    final quantity = json['quantity'] as int;
    final id = json['id'] as int;
    
    return Cart(
      itemId: itemId,
      userId: userId,
      quantity: quantity,
      id: id,
    );
  }
}
