import 'package:consulta_precos/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
     List<Widget> generateListProduct(BuildContext context) {
    return products.itens.
    map((product) => ProductListItem(product)).toList();
  }
    return  products.itens.isNotEmpty
            ?Expanded(
                  child: ListView(
                      children: generateListProduct(context),
                    ),
                ) 
                : const Text("Não há produtos cadastrados.");
  }
}
