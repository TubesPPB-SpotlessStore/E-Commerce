import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotless_store/constant.dart';
import 'package:spotless_store/utils/routes.dart';

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
        title: Text('Detail produk'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: const Color.fromRGBO(0, 203, 225, 1),
            onPressed: () {
              Navigator.pushNamed(context, rCart);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(imagePath, height: 200),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  price,
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    addToCart(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Tambah ke keranjang'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
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
