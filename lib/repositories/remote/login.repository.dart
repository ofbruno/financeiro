import 'package:financeiro/models/usuario.model.dart';
import 'package:financeiro/ui/login/login.viewmodel.dart';

class LoginRepository {
  Future<UsuarioModel> loginComEmail(LoginViewModel login) async {
    await Future.delayed(Duration(seconds: 2));

    return UsuarioModel(
      id: 1,
      email: 'ofbruno@gmail.com',
      nome: 'Bruno Fernandes',
    );
  }
}
