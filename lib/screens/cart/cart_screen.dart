import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final String description;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.quantity,
    required this.imageUrl,
  });
}

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  double _parsePrice(String price) {
    String cleanedPrice = price.replaceAll(
        RegExp(r'[^0-9]'), ''); // Remove all non-numeric characters
    return double.tryParse(cleanedPrice) ?? 0.0;
  }

  Future<void> _updateQuantityAndPrice(String id, int newQuantity) async {
    DocumentSnapshot docSnapshot = await cartCollection.doc(id).get();
    double unitPrice = _parsePrice(docSnapshot['price']);
    double newTotalPrice = newQuantity * unitPrice;

    await cartCollection.doc(id).update({
      'quantity': newQuantity,
      'totalPrice': newTotalPrice,
    });
  }

  void _increaseQuantity(String id, int currentQuantity) async {
    int newQuantity = currentQuantity + 1;
    await _updateQuantityAndPrice(id, newQuantity);
  }

  void _decreaseQuantity(String id, int currentQuantity) async {
    if (currentQuantity > 1) {
      int newQuantity = currentQuantity - 1;
      await _updateQuantityAndPrice(id, newQuantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder(
          stream: cartCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No items in cart'));
            }

            final cartItems = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;

              return CartItem(
                id: doc.id,
                title: data['title'] ?? 'No Title',
                price: _parsePrice(data['price'] ?? '0'),
                description: data['description'] ?? 'No Description',
                quantity: data['quantity'] ?? 1,
                imageUrl: data['imageUrl'] ?? '',
              );
            }).toList();

            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: cartItems[index].imageUrl.isNotEmpty
                      ? Image.network(
                          cartItems[index].imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/card.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                  title: Text(cartItems[index].title),
                  subtitle: Text(
                    "Rp${(cartItems[index].price * cartItems[index].quantity).toStringAsFixed(2).replaceAll(RegExp(r"([.]*00)(?!.*\d)"), "")}", // Updated here
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          _decreaseQuantity(
                              cartItems[index].id, cartItems[index].quantity);
                        },
                      ),
                      Text('Qty: ${cartItems[index].quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _increaseQuantity(
                              cartItems[index].id, cartItems[index].quantity);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
