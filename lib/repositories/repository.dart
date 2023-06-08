import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

abstract class Repository {
  final db = FirebaseFirestore.instance;
  // final _baseUrl = "https://dmcflutter23-default-rtdb.firebaseio.com/";

  final String _collection; //collection
  Repository(this._collection);

  Future<QuerySnapshot<Map<String, dynamic>>> list() {
    return db.collection(_collection).get();
    // final uri = Uri.parse("$_baseUrl/$_resource.json");
    // return http.get(uri);
  }

  Future<DocumentReference<Map<String, dynamic>>> insert(
      Map<String, dynamic> data) {
    return db.collection(_collection).add(data);
    // final uri = Uri.parse("$_baseUrl/$_resource.json");
    // return http.post(uri, body: data);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> show(String id) {
    // final uri = Uri.parse("$_baseUrl/$_resource/$id.json");
    return db.collection(_collection).doc(id).get();
  }

  Future<void> update(String id, Map<String, dynamic> data) {
    return db.collection(_collection).doc(id).set(data);
  }

  Future<void> delete(String id) {
    return db.collection(_collection).doc(id).delete();
  }

  Future<double> calcularValorTotalProdutos() async {
    double valorTotal = 0.0;

    // Obtendo a coleção "produtos" do Firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();

    // Iterando sobre os documentos da coleção
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      // Obtendo a quantidade e o preço de cada produto
      if (doc.exists) {
        int quantidade = (doc.data() as Map<String, dynamic>)['quantidade'];
        double preco = (doc.data() as Map<String, dynamic>)['preco'];

        // Calculando o valor total do produto
        double valorProduto = quantidade * preco;

        // Adicionando o valor do produto ao valor total
        valorTotal += valorProduto;
      }
    }

    return valorTotal;
  }
}
