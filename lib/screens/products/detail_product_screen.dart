import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailScreen(
        imagePath: 'assets/images/sample.png',
        title: 'Sample Product',
        price: '20',
        description: 'This is a sample product',
      ),
    );
  }
}

class Product {
  final String title;
  final String price;
  final String description;

  Product({
    required this.title,
    required this.price,
    required this.description,
  });
}

class ProductDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String description;

  const ProductDetailScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addToCart(context);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(BuildContext context) async {
    try {
      Product product = Product(
        title: title,
        price: price,
        description: description,
      );

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference cartCollection = firestore.collection('cart');

      await cartCollection.add({
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'quantity': 1,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Produk ditambahkan ke keranjang.'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menambahkan produk ke keranjang: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
