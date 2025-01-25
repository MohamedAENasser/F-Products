import 'package:flutter/material.dart';
import 'package:products/home/product/product_item.dart';
import 'package:products/home/product/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;
  List<ProductModel> products = [];
  bool isLoading = true;

  ProductViewModel(this.repository);

  Future<void> fetchProducts() async {
    try {
      products = await repository.fetchProducts();
    } catch (error) {
      print("Error fetching products: $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
