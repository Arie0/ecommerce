import 'package:ecommerce/screens/add_subcategory_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/sub_category_controller.dart'; // Importa o controlador de subcategorias
import '../widgets/sub_category_card.dart'; // Importa o widget SubCategoryCard

class SubCategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<SubCategoryController>(
          builder: (context, controller, child) {
            // Carrega as subcategorias
            controller
                .loadSubCategories(); // Garante que as subcategorias estão carregadas

            if (controller.subcategories.isEmpty) {
              return const Center(
                child: Text("Nenhuma subcategoria cadastrada"),
              );
            }
            return ListView.builder(
              itemCount: controller.subcategories.length,
              itemBuilder: (context, index) {
                return SubCategoryCard(
                  subCategory: controller.subcategories[
                      index], // Exibe cada subcategoria usando SubCategoryCard
                );
              },
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddSubCategoryPopup(); // Widget responsável por adicionar novas subcategorias
                },
              );
            },
            child: const Icon(Icons.add),
            backgroundColor:
                Colors.purple, // Define a cor de fundo do botão como laranja
          ),
        ),
      ],
    );
  }
}
