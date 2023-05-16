import 'package:consulta_precos/models/product.dart';
import 'package:consulta_precos/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
    this.product, {
    super.key,
  });

  final Product product;

  String _formatSubtitle() {
    String price = product.price.toStringAsFixed(2);
    return "R\$ $price (${product.quant}";
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () => products.removeItem(product),
      ),
      title: Text(product.name),
      subtitle: Text(_formatSubtitle()),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => products.addItem(product),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/product_show_screen', arguments: product);
        //Navigator.of(context)
        //    .push(MaterialPageRoute(builder: (context) => ProductShowScrenn())
        //   );
      },
    );
  }
}
