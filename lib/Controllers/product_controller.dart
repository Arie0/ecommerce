import '../models/product.dart';
import '../repositories/product_repository.dart';
import 'package:flutter/foundation.dart'; // Import necessário para ChangeNotifier

class ProductController extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository(); // Instância do repositório
  List<Product> _products = []; // Lista interna de produtos

  List<Product> get products => _products; // Getter para acessar a lista de produtos

  // Função para carregar os produtos
  void loadProducts() {
    _products = _repository.getProducts(); // Carrega produtos do repositório
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }

  // Função para adicionar um novo produto
  void addProduct(Product product) {
    _repository.addProduct(product); // Adiciona o produto ao repositório
    loadProducts(); // Recarrega produtos após adicionar
  }

  // Função para remover um produto
  void removeProduct(int id) {
    _repository.removeProduct(id); // Remove o produto do repositório
    loadProducts(); // Recarrega produtos após remover
  }
}
