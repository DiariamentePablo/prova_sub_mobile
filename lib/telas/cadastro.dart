import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prova_sub_mobile/classes/item.dart';

final nomeController = TextEditingController();
final descricaoController = TextEditingController();

class AdicionarItemPage extends StatefulWidget {
  const AdicionarItemPage({super.key});

  @override
  _AdicionarItemPageState createState() => _AdicionarItemPageState();
}

class _AdicionarItemPageState extends State<AdicionarItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Informe o nome do seu objeto e sua descrição'),
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            TextFormField(
              controller: descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () async {
                String result = await ItemController().salvarItem(
                  FirebaseAuth.instance.currentUser!.uid,
                  nomeController.text,
                  descricaoController.text,
                  Timestamp.now(),
                );
                if (result == "true"){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Objeto cadastrado com sucesso!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Falha no cadastro. $result',
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.person_add_alt_1_outlined),
              label: const Text('Salvar'),
            ),
          ],
        )
      ),
    );
  }
}