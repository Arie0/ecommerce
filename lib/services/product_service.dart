import '../models/product.dart';
import '../repositories/product_repository.dart';

class ProductService {
  final ProductRepository _repository = ProductRepository();

  List<Product> getProducts() {
    return _repository.getProducts();
  }

  void addProduct(Product product) {
    _repository.addProduct(product);
  }

  void removeProduct(int id) {
    _repository.removeProduct(id);
  }
}
