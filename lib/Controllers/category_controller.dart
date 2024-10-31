// lib/controllers/category_controller.dart
import 'package:ecommerce/Models/category.dart';
import 'package:flutter/material.dart';

class CategoryController extends ChangeNotifier {
  List<Category> _categories = [];
  int _nextId = 1;

  List<Category> get categories => _categories;

  void loadCategories() {
    // Dados iniciais ou mock para testar
    _categories = [
      Category(id: 1, name: "Eletrônicos"),
      Category(id: 2, name: "Roupas"),
    ];
    notifyListeners();
  }

  void addCategory(String name) {
    final newCategory = Category(id: _nextId++, name: name);
    _categories.add(newCategory);
    notifyListeners();
  }

  void removeCategory(int id) {
    _categories.removeWhere((category) => category.id == id);
    notifyListeners();
  }
}
