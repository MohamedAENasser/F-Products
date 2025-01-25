import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:products/home/product/product_repository.dart';
import 'package:products/home/product/product_view_model.dart';
import 'package:products/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(ProductRepository())..fetchProducts(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Container(
            color: Colors.white,
            child: SafeArea(
              child: HomeScreen(),
            ),
          )),
    );
  }
}
