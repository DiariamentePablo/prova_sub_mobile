import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Login {
  String usuario;
  String senha;
  String? email;

  Login({required this.usuario, required this.senha});
  fromMap(Map map) {
    email = map['email'];
    usuario = map['usuario'];
    senha = map['senha'];
  }

  Map<String, dynamic> toMap() {
    return {'usuario': usuario, 'senha': senha, 'email': email};
  }
}

abstract class LoginDao {
  Future<void> login(Login login);
  Future<void> registrar(Login login);
  Future<void> resetarSenha(String email);
  Future<void> logout();
}

class CredenciaisUsuario implements LoginDao {
  @override
  Future<void> login(Login login) async {
    await auth.signInWithEmailAndPassword(
      email: login.usuario,
      password: login.senha,
    );
  }

  @override
  Future<void> logout() {
    auth.signOut();
    return Future.value();
  }

  @override
  Future<void> registrar(Login login) async {
    await auth.createUserWithEmailAndPassword(
      email: login.usuario,
      password: login.senha,
    );
  }

  @override
  Future<void> resetarSenha(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
