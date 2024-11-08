import 'package:ecommerce/Repositories/subcategory_repository.dart';
import 'package:ecommerce/models/subcategory.dart';

class SubCategoryService {
  final SubCategoryRepository _repository = SubCategoryRepository();

  // Método para obter subcategorias
  List<SubCategory> getSubCategories() {
    return _repository.fetchCategories();
  }

  // Método para adicionar uma nova subcategoria
  SubCategory addSubCategory(SubCategory subcategory) {
    return _repository.createSubCategory(subcategory);
  }

  // Método para remover uma subcategoria
  void removeSubCategory(int id) {
    _repository.deleteSubCategory(id);
  }
}
