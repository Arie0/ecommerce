import '../models/product.dart';

class ProductRepository {
  // Simulando um banco de dados em memória
  final List<Product> _products = [];

  List<Product> getProducts() => _products;

  void addProduct(Product product) {
    _products.add(product);
  }

  void removeProduct(int id) {
    _products.removeWhere((product) => product.id == id);
  }
}
