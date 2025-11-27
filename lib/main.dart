import 'package:firebase_database/firebase_database.dart';
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
/*
      home: TelaLogin(),
      
      theme: AppTema.temaClaro,
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase App')),
        body: Center(child: Text('Firebase inicializado!')),
      ),

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/