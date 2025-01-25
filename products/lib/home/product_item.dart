import 'package:flutter/material.dart';

class ProductModel {
  final int id;
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
        rating: json['rating']);
  }
}

class Rating {
  final double rate;
  final double count;
  Rating({required this.rate, required this.count});
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
                  Image.asset(
                    product.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.blue,
                            size: 20,
                          ),
                        )),
                  )
                ],
              )),
          Spacer(),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text("EGP ${product.price * 0.75}",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${product.price} EGP",
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
                      Icon(
                        Icons.star_outlined,
                        color: Color.fromARGB(255, 238, 219, 47),
                        size: 20,
                      ),
                      Spacer(),
                      Icon(
                        Icons.add_circle_outlined,
                        color: Colors.blue,
                        size: 30,
                      )
                    ],
                  )
                ],
              )),
          Spacer()
        ],
      ),
    );
  }
}
