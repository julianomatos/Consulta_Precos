import 'package:consulta_precos/models/product.dart';
import 'package:consulta_precos/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final firebaseStorage = FirebaseStorage.instance;
  
  String _formatSubtitle() {
    String price = widget.product.price.toStringAsFixed(2);
    return "R\$ $price (${widget.product.quant}";
  }

  @override
  Widget build(BuildContext context) {

  // final reference = firebaseStorage.ref("products/IMG_2972.jpg");
  // final dado = reference.getData();

    final products = Provider.of<ProductsProvider>(context);
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () => products.removeItem(widget.product),
      ),
      title: Text(widget.product.name),
      subtitle: Text(_formatSubtitle()),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => products.addItem(widget.product),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/product_show_screen', arguments: widget.product);
        //Navigator.of(context)
        //    .push(MaterialPageRoute(builder: (context) => ProductShowScrenn())
        //   );
      },
    );
  }
}
