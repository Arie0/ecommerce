// lib/screens/add_category_popup.dart
import 'package:ecommerce/Controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryPopup extends StatefulWidget {
  @override
  _AddCategoryPopupState createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 182, 161, 245),
      title: Center(
        child: Text(
          'Adicionar Categoria',
          style: TextStyle(color: Colors.white),
        ),
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Nome da Categoria',
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white38),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Informe o nome da categoria';
            }
            return null;
          },
          onSaved: (value) {
            _name = value!;
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar', style: TextStyle(color: Colors.white70)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Provider.of<CategoryController>(context, listen: false)
                  .addCategory(_name);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
