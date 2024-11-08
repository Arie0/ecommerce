// category_service.dart
import 'package:ecommerce/models/category.dart';

class CategoryService {
  Future<Category> addCategory(Category category) async {
    // Lógica para adicionar a categoria ao banco de dados ou API
    // Suponha que a categoria é adicionada com sucesso e retornamos ela
    return category; // Retorne a categoria adicionada
  }

  final List<Category> _categories = [
    Category(id: 1, name: 'Eletrônicos'),
    Category(id: 2, name: 'Roupas'),
  ];

  List<Category> getCategories() => _categories;

  Future<void> removeCategory(int id) async {
    // Lógica para remover a categoria
  }
}
