import 'package:flutter/material.dart';
import 'package:products/product_item/product_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  final List<ProductModel> products = [
    const ProductModel(
        image: 'assets/images/product1.png',
        name: 'Product A',
        description: 'Description for Product A',
        price: 2500,
        review: 4.1),
    const ProductModel(
        image: 'assets/images/product1.png',
        name: 'Product B',
        description: 'Description for Product B',
        price: 3500,
        review: 3.5),
    const ProductModel(
        image: 'assets/images/product1.png',
        name: 'Product C',
        description: 'Description for Product C',
        price: 3000,
        review: 4.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
            );
          },
        ),
      ),
    );
  }
}
