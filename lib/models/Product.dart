class Product {
  final String id;
  final String title;
  final String price;
  final String description;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  // Factory constructor to create a Product from a Firestore map
  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      title: data['title'] ?? '',
      price: data['price'] ?? '',
      description: data['description'] ?? '',
      images: List<String>.from(data['images'] ?? []),
    );
  }
}
