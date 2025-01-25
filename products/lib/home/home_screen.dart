import 'package:flutter/material.dart';
import 'package:products/home/product_item.dart';

class HomeScreen extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
        id: 0,
        image: 'assets/images/product1.png',
        title: 'Product A',
        description: 'Description for Product A',
        price: 2500,
        category: '',
        rating: Rating(rate: 4.1, count: 10.0)),
    ProductModel(
        id: 0,
        image: 'assets/images/product1.png',
        title: 'Product N',
        description: 'Description for Product A',
        price: 2000,
        category: '',
        rating: Rating(rate: 3.1, count: 10.0)),
    ProductModel(
        id: 0,
        image: 'assets/images/product1.png',
        title: 'Product VC',
        description: 'Description for Product A',
        price: 4500,
        category: '',
        rating: Rating(rate: 2.1, count: 10.0)),
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
