import 'package:flutter/material.dart';
import 'package:ecommerce/models/subcategory.dart';
import 'package:ecommerce/services/subcategory_service.dart';

class SubCategoryController extends ChangeNotifier {
  final SubCategoryService _service = SubCategoryService();
  List<SubCategory> _subCategories = [];

  List<SubCategory> get subcategories => _subCategories;

  // Carrega as subcategorias
  void loadSubCategories() {
    _subCategories = _service.getSubCategories();
    notifyListeners();
  }

  // Adiciona uma nova subcategoria
  void addSubCategory(SubCategory subcategory) {
    _service.addSubCategory(subcategory);
    loadSubCategories(); // Recarrega a lista após adicionar
  }

  // Remove uma subcategoria
  void removeSubCategory(int id) {
    _service.removeSubCategory(id);
    loadSubCategories(); // Recarrega a lista após remover
  }
}
