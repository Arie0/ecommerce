import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/category_controller.dart';
import 'add_category_popup.dart';

class CategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoryController>(context, listen: false);
    controller.loadCategories();

    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AddCategoryPopup(),
              );
            },
          ),
        ],
      ),
      body: Consumer<CategoryController>(
        builder: (context, controller, child) {
          if (controller.categories.isEmpty) {
            return Center(
              child: Text(
                "Nenhuma categoria cadastrada",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return Card(
                elevation: 6,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  title: Text(
                    category.name,
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete,
                        color: const Color.fromARGB(255, 82, 2, 157)),
                    onPressed: () => controller.removeCategory(category.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
