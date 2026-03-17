class Product {
  final String id;
  final String title;
  //change price fromstring to double for easier calculations
  final double price; //bug 14 
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