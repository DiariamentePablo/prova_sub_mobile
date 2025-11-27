import 'package:flutter/material.dart';
import 'package:prova_sub_mobile/temas/tema_padrao.dart';

class AdicionarItemPage extends StatefulWidget {
  const AdicionarItemPage({super.key});

  @override
  _AdicionarItemPageState createState() => _AdicionarItemPageState();
}

class _AdicionarItemPageState extends State<AdicionarItemPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTema.temaClaro,
      home: Center(
        child: Text("Tela de Cadastro"),
      ),
    );
  }
}