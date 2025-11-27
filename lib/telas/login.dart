import 'package:flutter/material.dart';
import 'package:prova_sub_mobile/database/classes/login_controller.dart';

final formKey = GlobalKey<FormState>();
final loginController = TextEditingController();
final senhaController = TextEditingController();

class TelaLogin extends StatefulWidget {
  TelaLogin({super.key});

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Informe seu nome de usuário e senha'),
            TextFormField(
              controller: loginController,
              decoration: const InputDecoration(
                labelText: 'Usuário',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                if (await Logincontroller().autenticar(
                  loginController.text,
                  senhaController.text,
                )) {
                  Navigator.pushNamed(context, '/principal');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Falha no login. Verifique suas credenciais.',
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.login),
              label: const Text('Entrar'),
            ),
            OutlinedButton.icon(
              onPressed: () async {
                if (await Logincontroller().registrar(
                  loginController.text,
                  senhaController.text,
                )) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Usuário cadastrado com sucesso!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Falha no cadastro. Tente novamente.',
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.person_add_alt_1_outlined),
              label: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}