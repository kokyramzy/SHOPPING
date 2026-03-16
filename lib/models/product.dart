class Product {
  final String id;
  final String title;
  final double price; // subtle design issue
  final String imageUrl;
  final String description;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}