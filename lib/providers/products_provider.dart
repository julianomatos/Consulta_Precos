import 'package:flutter/widgets.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> itens = [
    Product(
      "p1", "Café", 10.99, 'Mercado',
        "https://lojamelitta.vteximg.com.br/arquivos/ids/160278-1000-1000/7891021006071_1--c83764eb-6820-45d4-bc16-b20aa54a78d1-.jpg?v=638169994383430000",
        1),
    Product(
      "p2", "Açucar", 4.99, 'Padaria',
        "https://protelimp.com.br/wp-content/uploads/a%C3%A7ucar-uni%C3%A3o.png",
        1),
  ];

  void addItem(Product product) {
    product.quant++;
    notifyListeners();
  }

  void removeItem(Product product) {
    if (product.quant > 0) {
      product.quant--;
      notifyListeners();
    }
  }

  int countItens() => itens.fold(0, (acc, p) => acc + p.quant);
  String totalPrice() =>
      itens.fold(0.0, (acc, p) => acc + p.price * p.quant).toStringAsFixed(2);
}
