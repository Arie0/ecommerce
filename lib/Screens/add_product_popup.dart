import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';
import '../controllers/category_controller.dart';
import '../models/product.dart';

class AddProductPopup extends StatefulWidget {
  @override
  _AddProductPopupState createState() => _AddProductPopupState();
}

class _AddProductPopupState extends State<AddProductPopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0.0;
  String? _selectedCategoryId; // Categoria selecionada

  @override
  Widget build(BuildContext context) {
    // Obtenha as categorias do CategoryController
    final categoryController = Provider.of<CategoryController>(context);
    final categories = categoryController.categories;

    return AlertDialog(
      title: Text('Adicionar Produto'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do produto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço do Produto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Informe um preço válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Categoria'),
                value: _selectedCategoryId,
                items: context
                    .watch<CategoryController>()
                    .categories
                    .map((category) {
                  return DropdownMenuItem<String>(
                    value: category.id.toString(), // Converte o ID para String
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategoryId = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Selecione uma categoria';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop(); // Fecha o pop-up
          },
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newProduct = Product(
                id: 0,
                name: _name,
                price: _price,
                categoryId:
                    _selectedCategoryId!, // Associa a categoria selecionada
              );
              Provider.of<ProductController>(context, listen: false)
                  .addProduct(newProduct); // Adiciona o novo produto
              Navigator.of(context).pop(); // Fecha o pop-up após adicionar
            }
          },
        ),
      ],
    );
  }
}
