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
      appBar: AppBar(
        title: Text("Registro de itens"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.assignment_ind),
              ),
            ),
            TextFormField(
              controller: descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                prefixIcon: Icon(Icons.info),
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
              icon: const Icon(Icons.check_circle),
              label: const Text('Salvar'),
            ),
          ],
        )
      ),
    );
  }
}