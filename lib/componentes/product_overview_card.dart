
import 'package:consulta_precos/providers/products_provider.dart';
import 'package:consulta_precos/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_precos/repositories/repository.dart';


class ProductOverviewCard extends StatelessWidget {
  const ProductOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const Text(
          "Total",
          style: TextStyle(fontSize: 36.0),
        ),
        Column(
          children: [
            const Text("Quant"),
            Text(
              "${products.countItens()}",
            style: const TextStyle(fontSize: 36.0),
            ),
          ],
        ),
        Column(
          children: [
            const Text("R\$"),
            // Text(products.totalPrice(),
            Text(Repository)
            style: const TextStyle(fontSize: 36.0),),
          ],
        )
      ]),
    );
  }
}
