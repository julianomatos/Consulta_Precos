import 'dart:convert';
import 'package:consulta_precos/models/product.dart';
import 'package:consulta_precos/repositories/product_repository.dart';
import 'package:http/http.dart';

class ProductsService {
  final ProductsRepository _productsRepository = ProductsRepository();

  Future<List<Product>> list() async {
    try {
      Response response = await _productsRepository.list();
      Map<String, dynamic> json = jsonDecode(response.body);
      return Product.listFromJson(json);
    } catch (err) {
      throw Exception("Problemas ao consultar lista.");
    }
  }

  Future<String> insert(Product product) async {
    try {
      String json = jsonEncode(product.toJson());
      Response response = await _productsRepository.insert(json);
      return jsonDecode(response.body) as String;
    } catch (err) {
      throw Exception("Problemas ao inserir.");
    }
  }
}
