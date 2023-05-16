

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:consulta_precos/screens/product_list_screen.dart';
import 'package:consulta_precos/screens/product_show_screen.dart';
import 'package:flutter/material.dart';

void main() =>  runApp(App());


class App extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: ProductListScreen(_product),
        routes: {
          '/': (context) => ProductListScreen(),
          '/product_show_screen': (context) => const ProductShowScrenn(),
        }
        );
  }
}
