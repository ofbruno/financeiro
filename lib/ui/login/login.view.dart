import 'package:financeiro/bases/base_stateful.view.dart';
import 'package:financeiro/bases/view_settings.dart';
import 'package:financeiro/ui/login/login.controller.dart';
import 'package:financeiro/ui/login/login.viewmodel.dart';
import 'package:financeiro/utils/responsivo.dart';
import 'package:financeiro/widgets/button.widget.dart';
import 'package:financeiro/widgets/button_facebook.widget.dart';
import 'package:financeiro/widgets/button_google.widget.dart';
import 'package:financeiro/widgets/link_button.widget.dart';
import 'package:financeiro/widgets/textform.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends BaseViewStateful<LoginController> {
  LoginView({Key key}) : super(key: key, controller: LoginController());

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseViewState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusEmail = new FocusNode();
  final FocusNode _focusPassword = new FocusNode();
  final FocusNode _focusButton = new FocusNode();
  var _vm = new LoginViewModel();
  MaterialColor _showHidePasswordColor = Colors.grey;
  bool _showHidePassword = false;
  ScrollController _scrollController = new ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    this._focusPassword.addListener(this._focusPasswordListener);
    super.initState();
  }

  @override
  void dispose() {
    this._focusPassword.removeListener(this._focusPasswordListener);
    super.dispose();
  }

  @override
  ViewSettings viewSettings() {
    return ViewSettings(
      toolbar: ViewSettingsToolbar(
        visible: false,
      ),
    );
  }

  @override
  Widget body() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageLogo(),
            _loginField(),
            _passwordField(),
            _enterButton(),
            _forgetPasswordButton(),
            _facebookButton(),
            _googleButton(),
          ],
        ),
      ),
    );
  }

  Widget _imageLogo() {
    return Container(
      width: Responsivo.fracaoLarguraTela(35),
      height: Responsivo.fracaoLarguraTela(35),
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget _loginField() {
    return TextFormApp(
      label: 'E-mail',
      focusNode: _focusEmail,
      nextFocusNode: _focusPassword,
      onSaved: (val) => _vm.login = val,
      validator: (val) {
        if (val.isEmpty) {
          return 'Informe seu e-mail';
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormApp(
      label: 'Senha',
      focusNode: _focusPassword,
      nextFocusNode: _focusButton,
      password: !_showHidePassword,
      textInputAction: TextInputAction.go,
      inputDecoration: InputDecoration(
        labelText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(
            FontAwesomeIcons.eye,
            //size: Responsivo.fonte(16),
            color: _showHidePasswordColor,
          ),
          onPressed: () {
            setState(() {
              _showHidePassword = !_showHidePassword;
              if (_showHidePassword)
                _showHidePasswordColor = Colors.grey;
              else
                _showHidePasswordColor = Theme.of(context).primaryColor;
            });
          },
        ),
      ),
      onSaved: (val) => _vm.senha = val,
      onEditingComplete: _validateCredentials,
      validator: (val) {
        if (val.isEmpty) {
          return 'Informe sua senha';
        }
        return null;
      },
    );
  }

  Widget _enterButton() {
    return ButtonApp(
      label: 'Entrar com e-mail',
      onPressed: _validateCredentials,
    );
  }

  Widget _forgetPasswordButton() {
    return LinkButtonApp(
      label: 'Esqueci minha senha',
      onTap: () => widget.controller.rememberPassword(_vm.login),
    );
  }

  Widget _facebookButton() {
    return ButtonFacebookApp(
      onPressed: widget.controller.loginWithFacebook,
    );
  }

  Widget _googleButton() {
    return ButtonAppGoogle(
      onPressed: widget.controller.loginWithGoogle,
    );
  }

  void _validateCredentials() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      bool sucesso = await widget.controller.loginWithEmail(_vm);

      if (sucesso) {
        //TODO: navegar para home
      }
    }
  }

  Future<Null> _focusPasswordListener() async {
    if (this._focusPassword.hasFocus) {
      this._scrollController.animateTo(
            this._scrollController.position.pixels + Responsivo.fracaoAlturaTela(10),
            duration: new Duration(milliseconds: 500),
            curve: Curves.easeOutCirc,
          );
    } else {
      this._scrollController.animateTo(
            0.0,
            duration: new Duration(milliseconds: 500),
            curve: Curves.easeOutCirc,
          );
    }
  }
}
