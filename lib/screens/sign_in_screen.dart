// ignore_for_file: use_build_context_synchronously

import 'package:consulta_precos/routes/route_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    try {
      // ignore: unused_local_variable
      final user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário autenticado.'),
          duration: Duration(seconds: 2),
        ),);
        Navigator.of(context).restorablePushReplacementNamed(RoutePaths.PRODUCTS_LIST_SCREEN);
      
    } catch (e) {
      setState(() {
        errorMessage = getErrorMessage(e);
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  String getErrorMessage(dynamic error) {
    String errorMessage = '';

    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          errorMessage = 'Usuário não encontrado.';
          break;
        case 'invalid-email':
          errorMessage = 'Email inválido.';
          break;
        case 'wrong-password':
          errorMessage = 'Senha inválida.';
          break;
        default:
          errorMessage = 'Erro desconhecido.';
      }
    } else {
      errorMessage = 'Erro desconhecido.';
    }

    return errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'e-mail'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'senha'),
            ),
            if (isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text('Login'),
              ),
            const SizedBox(height: 16),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
