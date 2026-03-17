import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ShopProvider with ChangeNotifier {
  // bug 11
  //change vat to 0.14 to represent 14%
  static const double vatRate = 0.14;

  List<Product> products = [
    const Product(
      id: 'p1',
      title: 'كاميرا احترافية',
     // removed quotes from price, now a double
      price: 23000,
      imageUrl: 'https://picsum.photos/seed/p1/400/300',
      description: 'كاميرا بدقة عالية مناسبة للتصوير.',
    ),
    const Product(
      id: 'p2',
      title: 'لابتوب 14 بوصة',
      price: 44500,
      imageUrl: 'https://picsum.photos/seed/p2/400/300',
      description: 'لابتوب أداء قوي.',
    ),
  ];

  List<Product> cart = [];
  double total = 0;

  Product byId(String id) {
    return products.firstWhere((p) => p.id == id);
  }

  void addToCart(Product product) {
    //add same product more than once 
      cart.add(product);
    
    // bug 12
    //added notifylistener() to update ui after click on add button
    notifyListeners();
    recalculateTotal();
  }

  void removeFromCart(Product product) {
    cart.remove(product);

    recalculateTotal();

    notifyListeners();
  }

  double calculateFinalPrice(Product product) {
    //remove double.parse since prise is already a double
    double price = (product.price);
    // bug 13 check calculation order
    // applied discound before vat to ensure correct final price calculation
    if (price > 10000) {
      price -= price * 0.10;
    }
    price += price * 0.14;

    

    return price;
  }

  void recalculateTotal() {
    total = 0;

    for (var item in cart) {
      total += calculateFinalPrice(item);
    }

    total = double.parse(total.toStringAsFixed(2));
  }
}
