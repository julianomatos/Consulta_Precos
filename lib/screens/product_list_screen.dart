import 'package:consulta_precos/componentes/product_list.dart';
import 'package:consulta_precos/componentes/product_overview_card.dart';
import 'package:consulta_precos/providers/products_provider.dart';
import 'package:consulta_precos/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultor de Preços'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProductsProvider(),
        child: Column(
          children: const [
            ProductOverviewCard(),
            ProductList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutePaths.PRODUCT_INSERT_SCREEN);
          }),
    );
  }
}
