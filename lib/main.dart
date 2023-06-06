

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:consulta_precos/screens/product_insert_screen.dart';
import 'package:consulta_precos/screens/product_list_screen.dart';
import 'package:consulta_precos/screens/product_show_screen.dart';
import 'package:consulta_precos/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'routes/route_path.dart';

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  runApp(App());
} 


class App extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: ProductListScreen(_product),
        routes: {
        RoutePaths.SIGN_IN_SCREEN: (context) => SingInScreen(),
        RoutePaths.PRODUCTS_LIST_SCREEN: (context) => ProductListScreen(),
        RoutePaths.PRODUCT_SHOW_SCREEN: (context) => ProductShowScrenn(),
        RoutePaths.PRODUCT_INSERT_SCREEN: (context) => ProductInsertScreen(),
      
      }
        );
  }
}
