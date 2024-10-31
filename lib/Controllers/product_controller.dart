import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductController extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  // Função para carregar produtos iniciais
  void loadProducts() {
    // iniciar a lista de produtos
    _products = [
      Product(id: 1, name: 'Dress', price: 30.0),
      Product(id: 2, name: 'T-shirt', price: 20.0),
    ];
    notifyListeners();
  }

  // adicionar um novo produto
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  //  remover um produto
  void removeProduct(int id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
