import 'package:ecommerce/models/subcategory.dart';

class SubCategoryRepository {
  // Simulando um banco de dados em memória
  final List<SubCategory> _subCategories = [];

  // Método para buscar todas as subcategorias
  List<SubCategory> fetchCategories() {
    return List.from(_subCategories); // Retorna uma cópia da lista
  }

  // Método para criar uma nova subcategoria
  SubCategory createSubCategory(SubCategory subcategory) {
    _subCategories.add(subcategory);
    return subcategory; // Retorna a subcategoria criada
  }

  // Método para deletar uma subcategoria
  void deleteSubCategory(int id) {
    _subCategories.removeWhere((subcategory) => subcategory.id == id);
  }
}
