import '../models/Category.dart';

class CategoryRepository {
  final List<Category> _categorys = [];

  // Busca todos os produtos
  Future<List<Category>> fetchCategorys() async {
    return List.from(_categorys); // Retorna uma cópia da lista de produtos
  }

  // Cria e adiciona um novo produto à lista
  Future<Category> createCategory(Category category) async {
    _categorys.add(category);
    return category; // Retorna o produto criado
  }

  // Remove um produto da lista pelo ID
  Future<void> deleteCategory(int id) async {
    _categorys.removeWhere((Category) => Category.id == id);
  }
}
