import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Item {
  String nome;
  String descricao;
  Timestamp data;
  
  Item({required this.nome, required this.descricao, required this.data});
  fromMap(Map map){
    nome = map['nome'];
    descricao = map['descricao'];
    data = map['data'];
  }

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'descricao': descricao, 'data': data};
  }
}

class ItemController {
  FirebaseDatabase database = FirebaseDatabase.instance;

  String salvarItem(String uid, String nome, String descricao, Timestamp data) {
    try {
      DatabaseReference ref = database.ref('usuarios/$uid/itens').push();
      ref.set(
        {
          'nome': nome,
          'descricao': descricao,
          'data': data.toDate().toString(),
        }
      );
      return "true";
    } catch (e) {
      return "$e";
    }
  }

  // Ler dados uma vez
  Future lerItem(String uid) async {
    DatabaseReference ref = database.ref('usuarios/$uid/itens');
    DatabaseEvent event = await ref.once();
    if (event.snapshot.exists) {
      print('Dados lidos: ${event.snapshot.value}');
    }
    else {
      print('Nenhum dado encontrado.');
    }
  }

  // Escutar alterações
  void escutar(String uid) {
      DatabaseReference _ref = database.ref('usuarios/$uid/itens');
      
      _ref.onValue.listen(
        (DatabaseEvent event) {
            if (event.snapshot.exists) {
              print('Dados atualizados: ${event.snapshot.value}');
            }
      });
  }

  /*
  // Le todos os dados 
  Future listarItems() async {
      DatabaseReference ref = database.ref('/usuarios/<uid>/itens/');
      DatabaseEvent event = await ref.once();
      List users = [];
      if (event.snapshot.value != null) {
        Map map = event.snapshot.value as Map;
        map.forEach((key, value) {
          final userMap = Map.from(value as Map);
          userMap['id'] = key; // 🔸 injeta o key como id
          produtos.add(user.fromMap(userMap));
        });
      }
      return produtos;
    }
*/
}