import 'package:flutter/material.dart';

class ProductModel {
  final String image;
  final String name;
  final double price;
  final double review;

  const ProductModel({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.review,
  });
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 1),
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
                      child: Icon(
                        Icons.heart_broken,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  )
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
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
                      Text("Review(${product.review})",
                          style: const TextStyle(color: Colors.black)),
                      Icon(
                        Icons.star_outlined,
                        color: Color.fromARGB(255, 238, 219, 47),
                        size: 20,
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
