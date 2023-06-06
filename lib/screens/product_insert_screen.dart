//import 'dart:html';

// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:consulta_precos/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:location/location.dart';

class ProductInsertScreen extends StatefulWidget {
  const ProductInsertScreen({super.key});

  @override
  State<ProductInsertScreen> createState() => _ProductInsertScreen();
}

class _ProductInsertScreen extends State<ProductInsertScreen> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _location = TextEditingController();
  final _imageUrl = TextEditingController();
  final _quant = TextEditingController();
  File? image;

  Future<void> pickImage() async{
    final picker = ImagePicker();
    final pickImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 200,
      );
      if (pickImage != null){
        setState(() {
          image = File(pickImage.path);
        });
        final firebaseStorage = FirebaseStorage.instance;
        final reference = firebaseStorage.ref("products/123456.jpg");
        reference.putFile(image!);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: _name,
            decoration: const InputDecoration(labelText: "Nome"),
          ),
          TextField(
            controller: _price,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Preço"),
          ),
          FutureBuilder<String>(
              future: getLocation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro ao consultar dados ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  _location.text = snapshot.data!;
                    return TextField(
                      controller: _location,
                      decoration:
                          const InputDecoration(labelText: "Localização"),
                    );
                  } else {
                    return const Center(
                      child: Text('.'),
                    );
                  }
                }, ),
          TextField(
            controller: _imageUrl,
            decoration: const InputDecoration(labelText: "URL da imagem"),
          ),
          IconButton(onPressed: (){
            pickImage();
          },
           icon: const Icon(Icons.camera)),
          TextField(
            controller: _quant,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Quantidade"),
          ),
          ElevatedButton(
            onPressed: () {
              Product product = Product(_name.text, double.parse(_price.text),
                  _location.text, _imageUrl.text, int.parse(_quant.text));
                  
            },
            child: const Text("Salvar"),
          )
        ]),
      ),
    );
  }

  Future<String> getLocation() async {
    Location location = Location();
    bool serviceEnable;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnable = await location.serviceEnabled();
    if (!serviceEnable) {
      serviceEnable = await location.requestService();
      if (!serviceEnable) Future.value("");
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) Future.value("");
    }
    locationData = await location.getLocation();
    return "${locationData.latitude} : ${locationData.longitude}";
  }
}
