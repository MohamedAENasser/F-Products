import 'package:flutter/material.dart';

class ProductModel {
  final num id;
  final String image;
  final String title;
  final double price;
  final String description;
  final String category;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        rating: Rating.fromJson(json['rating'] as Map<String, dynamic>));
  }
}

class Rating {
  final num rate;
  final num count;
  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  Image.network(
                    product.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.favorite_outline,
                            color: Colors.blue,
                            size: 20,
                          ),
                        )),
                  )
                ],
              )),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    product.description,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text("EGP ${(product.price * 0.75).toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("${product.price.toStringAsFixed(2)} EGP",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10,
                              color: Colors.blueAccent)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Review(${product.rating.rate})",
                          style: const TextStyle(color: Colors.black)),
                      const Icon(
                        Icons.star_outlined,
                        color: Color.fromARGB(255, 238, 219, 47),
                        size: 20,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.blue,
                        size: 30,
                      )
                    ],
                  )
                ],
              )),
          const Spacer()
        ],
      ),
    );
  }
}
