import 'package:ecommerce/models/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/sub_category_controller.dart';
import '../controllers/category_controller.dart';
import '../models/category.dart';

class AddSubCategoryPopup extends StatefulWidget {
  @override
  _AddSubCategoryPopupState createState() => _AddSubCategoryPopupState();
}

class _AddSubCategoryPopupState extends State<AddSubCategoryPopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    // Obtém a lista de categorias do CategoryController
    final categories = Provider.of<CategoryController>(context).categories;

    return AlertDialog(
      title: const Text('Adicionar Subcategoria'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Nome da Subcategoria'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome da subcategoria';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            DropdownButtonFormField<Category>(
              decoration: const InputDecoration(labelText: 'Categoria'),
              items: categories.map((category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Selecione uma categoria';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop(); // Fecha o pop-up
          },
        ),
        TextButton(
          child: const Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newSubCategory = SubCategory(
                id: 0, // ID pode ser gerado ou gerenciado pelo repositório
                name: _name,
                categoryId: _selectedCategory!.id,
                category: _selectedCategory!,
              );
              // Adiciona a nova subcategoria usando o SubCategoryController
              Provider.of<SubCategoryController>(context, listen: false)
                  .addSubCategory(newSubCategory);
              Navigator.of(context).pop(); // Fecha o pop-up após adicionar
            }
          },
        ),
      ],
    );
  }
}
