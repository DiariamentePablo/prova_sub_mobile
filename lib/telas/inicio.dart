import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Conectado como: ${FirebaseAuth.instance.currentUser?.email}'),
            TextButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/cadastro'),
              icon: const Icon(
                Icons.description,
                color: Colors.redAccent,
              ),
              label: const Text('Cadastro de itens'),
            ),
            TextButton.icon(
              onPressed: () => {
                Navigator.pop(context),
                FirebaseAuth.instance.signOut()
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.redAccent,
              ),
              label: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}