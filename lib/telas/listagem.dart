import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListarItensPage extends StatefulWidget {
  const ListarItensPage({super.key});

  @override
  _ListarItensPageState createState() => _ListarItensPageState();
}

class _ListarItensPageState extends State<ListarItensPage> {
  final DatabaseReference itemsRef = FirebaseDatabase.instance.ref('usuarios/${FirebaseAuth.instance.currentUser!.uid}/itens');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista")),
      body: FirebaseAnimatedList(
        query: itemsRef.orderByChild('data'),
        defaultChild: Center(
          child: CircularProgressIndicator(),
        ),
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index
        ) {
          if(snapshot.value == null) {
            return Text("Volte aqui quando você tiver feito uma lista.");
          }
          final item = snapshot.value as Map<dynamic, dynamic>;
          final String nome = item['nome'] ?? 'Objeto não nomeado.';
          final String descricao = item['descricao'] ?? '...';
          final String data = item['data'] ?? '2000-01-01 00:00:00';
          return Card(
            child: ListTile(
              title: Text(nome),
              subtitle: Text(data),
              trailing: IconButton(
                icon: Icon(Icons.description),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(nome),
                        content: Text('$descricao\n$data'),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        }
      )
    );
  }
}