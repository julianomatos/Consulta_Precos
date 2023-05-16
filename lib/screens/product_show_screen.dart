import 'package:consulta_precos/models/product.dart';
import 'package:flutter/material.dart';


class ProductShowScrenn extends StatelessWidget {
  const ProductShowScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute
                    .of(context)?.settings
                    .arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.name),
          Text(product.price.toStringAsFixed(2)),
          Text(product.location)
        ]
      ),
    );
  }
}
