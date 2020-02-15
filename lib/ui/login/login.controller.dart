import 'package:financeiro/bases/base.controller.dart';
import 'package:financeiro/models/usuario.model.dart';
import 'package:financeiro/repositories/remote/login.repository.dart';
import 'package:financeiro/ui/login/login.viewmodel.dart';

class LoginController extends BaseController {
  LoginRepository _loginRepository;

  LoginController() {
    _loginRepository = new LoginRepository();
  }

  Future<bool> loginWithEmail(LoginViewModel dadosLogin) async {
    var usuario = await _loginRepository.loginComEmail(dadosLogin);
    print(usuario);
    return true;
  }

  Future<bool> loginWithFacebook() async {
    var vm = LoginViewModel();
    var usuario = await _loginRepository.loginComEmail(vm);
    print(usuario);
    return true;
  }

  Future<bool> loginWithGoogle() async {
    var vm = LoginViewModel();
    var usuario = await _loginRepository.loginComEmail(vm);
    print(usuario);
    return true;
  }

  Future<bool> rememberPassword(String email) async {
    return true;
  }
}
