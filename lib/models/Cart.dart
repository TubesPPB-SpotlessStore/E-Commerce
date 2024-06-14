import 'package:cloud_firestore/cloud_firestore.dart';
import 'Product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  // Factory constructor to create a CartItem from a Firestore document
  factory CartItem.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CartItem(
      product: Product.fromMap(data['product'], doc.id),
      quantity: data['quantity'] ?? 1,
    );
  }
}
