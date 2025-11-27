import 'package:prova_sub_mobile/database/classes/credenciais.dart';

class Logincontroller {
  Future<bool> autenticar(String usuario, String senha) async {
    LoginDao loginDao = CredenciaisUsuario();
    try {
      await loginDao.login(Login(usuario: usuario, senha: senha));
      print('Login bem-sucedido');
      return true;
    } catch (e) {
      print('Erro no login: $e');
      return false;
    }
  }

  Future<bool> registrar(String usuario, String senha) async {
    LoginDao loginDao = CredenciaisUsuario();
    try {
      await loginDao.registrar(Login(usuario: usuario, senha: senha));
      print('Registro bem-sucedido');
      return true;
    } catch (e) {
      print('Erro no registro: $e');
      return false;
    }
  }

  Future<void> resetarSenha(String email) async {
    LoginDao loginDao = CredenciaisUsuario();
    try {
      await loginDao.resetarSenha(email);
      print('E-mail de redefinição de senha enviado');
    } catch (e) {
      print('Erro ao enviar e-mail de redefinição de senha: $e');
    }
  }

  Future<void> logout() async {
    LoginDao loginDao = CredenciaisUsuario();
    try {
      await loginDao.logout();
      print('Logout bem-sucedido');
    } catch (e) {
      print('Erro no logout: $e');
    }
  }
}