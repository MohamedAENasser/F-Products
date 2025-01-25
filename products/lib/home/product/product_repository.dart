import 'dart:convert';
import 'package:products/home/product/product_item.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
