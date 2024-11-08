import 'package:ecommerce/Screens/product_list_screen.dart';
import 'package:ecommerce/screens/category_list_screen.dart';
import 'package:ecommerce/screens/subcategory_screen.dart';
import 'package:ecommerce/widgets/appscaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/product_controller.dart';
import 'controllers/category_controller.dart';
import 'controllers/sub_category_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => CategoryController()),
        ChangeNotifierProvider(create: (_) => SubCategoryController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AppScaffold(
        bodyContent:
            ProductListScreen(), // Define a tela inicial como ProductListScreen
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text('Produtos'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('SubCategorias'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubCategoryListScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: ProductListScreen(), // Tela padrão inicial
    );
  }
}
