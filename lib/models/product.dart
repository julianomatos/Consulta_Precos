class Product {
  String? id;
  String name;
  double price;
  String location;
  String imageUrl;
  int quant;

  Product(this.name, this.price, this.location, this.imageUrl, this.quant);

  Product.fromJson(String this.id, Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        location = json['location'],
        imageUrl = json['imageUrl'],
        quant = json['quant'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'location': location,
        'imageUrl': imageUrl,
        'quant': quant
      };

  // static List<Product> listFromJson(Map<String, dynamic> json) {
  //   List<Product> produts = [];
  //   json.forEach((key, value) {
  //     Map<String, dynamic> item = {'id': key, ...value};
  //     produts.add(Product.fromJson(item));
  //   });
  //   return produts;
  // }
}
