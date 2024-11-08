import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../controllers/category_controller.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category}) : super(key: ValueKey(category.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(category.name),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Diálogo de confirmação antes de remover a categoria
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirmar Exclusão'),
                  content: Text(
                      'Você tem certeza que deseja remover esta categoria?'),
                  actions: [
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha o diálogo
                      },
                    ),
                    TextButton(
                      child: Text('Excluir'),
                      onPressed: () {
                        Provider.of<CategoryController>(context, listen: false)
                            .removeCategory(category.id);
                        Navigator.of(context).pop(); // Fecha o diálogo
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
