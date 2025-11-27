import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prova_sub_mobile/telas/cadastro.dart';
import 'package:prova_sub_mobile/telas/inicio.dart';
import 'package:prova_sub_mobile/telas/listagem.dart';
import 'firebase_options.dart';
import 'package:prova_sub_mobile/telas/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/cadastro': (context) => AdicionarItemPage(),
      '/principal': (context) => TelaInicial(),
      '/listagem': (context) => ListarItensPage(),
    },
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo"),
      ),
      body: FutureBuilder(
        future: _fApp,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Text("Algo de errado com o firebase");
          }
          else if(snapshot.hasData) {
            return content();
          }
          else {
            return CircularProgressIndicator();
          }
        }
      ),
    );
  }

  Widget content() {
    return TelaLogin();
  }
}