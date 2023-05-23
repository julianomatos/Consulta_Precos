import 'dart:convert';
import 'package:consulta_precos/models/product.dart';
import 'package:consulta_precos/repositories/product_repository.dart';
import 'package:http/http.dart';

class ProductsService {
  final ProductsRepository _productsRepository = ProductsRepository();

  Future<List<Product>> list() async {
    try {
      Response response = await _productsRepository.list();
      
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return Product.listFromJson(json);
      } else {
        throw Exception('Erro ${response.statusCode}: Problemas ao consultar lista.');
      }
    } catch (err) {
      throw Exception("Erro: Problemas ao consultar lista.");
    }
  }

  Future<String> insert(Product product) async {
    try {
      String json = jsonEncode(product.toJson());
      Response response = await _productsRepository.insert(json);
      
      if (response.statusCode == 201) {
        return jsonDecode(response.body) as String;
      } else {
        throw Exception('Erro ${response.statusCode}: Problemas ao inserir.');
      }
    } catch (err) {
      throw Exception("Erro: Problemas ao inserir.");
    }
  }

  Future<Product> show(String productId) async {
    try {
      Response response = await _productsRepository.show(productId);
      
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return Product.fromJson(json);
      } else {
        throw Exception('Erro ${response.statusCode}: Problemas ao exibir o produto.');
      }
    } catch (err) {
      throw Exception("Erro: Problemas ao exibir o produto.");
    }
  }

  Future<void> update(String productId, Product updatedProduct) async {
    try {
      String json = jsonEncode(updatedProduct.toJson());
      Response response = await _productsRepository.update(productId, json);
      
      if (response.statusCode != 200) {
        throw Exception('Erro ${response.statusCode}: Problemas ao atualizar o produto.');
      }
    } catch (err) {
      throw Exception("Erro: Problemas ao atualizar o produto.");
    }
  }

  Future<void> delete(String productId) async {
    try {
      Response response = await _productsRepository.delete(productId);
      
      if (response.statusCode != 200) {
        throw Exception('Erro ${response.statusCode}: Problemas ao excluir o produto.');
      }
    } catch (err) {
      throw Exception("Erro: Problemas ao excluir o produto.");
    }
  }
}
