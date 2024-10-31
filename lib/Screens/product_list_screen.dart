import 'package:ecommerce/Controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_card.dart';
import 'add_product_popup.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Carregar os produtos quando a tela for construída
    final controller = Provider.of<ProductController>(context, listen: false);
    controller.loadProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddProductPopup();
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              // Implementar a funcionalidade de pesquisa
            },
          ),
        ],
      ),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          if (controller.products.isEmpty) {
            return const Text("nenhum produto cadastrado");
          }
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: controller.products[index],
                onDelete: () {},
              );
            },
          );
        },
      ),
    );
  }
}
