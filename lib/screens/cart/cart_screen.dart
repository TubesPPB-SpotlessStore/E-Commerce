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

  Future<void> _deleteCartItem(String id) async {
    await cartCollection.doc(id).delete();
  }

  Future<void> _showDeleteConfirmationDialog(String id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text(
              'Are you sure you want to remove this item from the cart?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteCartItem(id);
              },
            ),
          ],
        );
      },
    );
  }

  void _increaseQuantity(String id, int currentQuantity) async {
    int newQuantity = currentQuantity + 1;
    await _updateQuantityAndPrice(id, newQuantity);
  }

  void _decreaseQuantity(String id, int currentQuantity) async {
    if (currentQuantity > 1) {
      int newQuantity = currentQuantity - 1;
      await _updateQuantityAndPrice(id, newQuantity);
    } else {
      await _showDeleteConfirmationDialog(id);
    }
  }

  double _calculateTotalPrice(List<CartItem> cartItems) {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void _checkout(double totalPrice) {
    Navigator.of(context).pushReplacementNamed('/payment');
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

            double totalPrice = _calculateTotalPrice(cartItems);

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                          "Rp${(cartItems[index].price * cartItems[index].quantity).toStringAsFixed(2).replaceAll(RegExp(r"([.]*00)(?!.*\d)"), "")}",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                _decreaseQuantity(cartItems[index].id,
                                    cartItems[index].quantity);
                              },
                            ),
                            Text('Qty: ${cartItems[index].quantity}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                _increaseQuantity(cartItems[index].id,
                                    cartItems[index].quantity);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: Rp${totalPrice.toStringAsFixed(2).replaceAll(RegExp(r"([.]*00)(?!.*\d)"), "")}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _checkout(totalPrice);
                        },
                        child: Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
