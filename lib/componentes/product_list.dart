import 'package:consulta_precos/models/product.dart';
import 'package:consulta_precos/services/products_service.dart';
import 'package:flutter/material.dart';

import 'product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    //final products = Provider.of<ProductsProvider>(context);
    List<Widget> generateListProduct(List<Product> products) {
      return products.map((product) => ProductListItem(product)).toList();
    }

    return FutureBuilder<List<Product>>(
        future: ProductsService().list(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
     //       final errorMessage = snapshot.error ?? 'Erro desconhecido';
    //        print(errorMessage);
            return Center(
              child: Text('Erro ao consultar dados ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final list = snapshot.data;
            if (list != null && list.isNotEmpty) {
              return Expanded(
                child: ListView(
                  children: generateListProduct(list),
                ),
              );
            } else {
              return const Center(
                child: Text('Nenhum produto cadastrado.'),
              );
            }
          } else {
            return const Center(
              child: Text('Nenhum produto cadastrado.'),
            );
          }
        });
  }
}
