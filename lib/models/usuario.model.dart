class UsuarioModel {
  int id;
  String nome;
  String email;
  String senha;
  int tipoLogin;
  String urlFoto;

  UsuarioModel({this.id, this.nome, this.email, this.senha, this.tipoLogin, this.urlFoto});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    tipoLogin = json['tipoLogin'];
    urlFoto = json['urlFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['tipoLogin'] = this.tipoLogin;
    data['urlFoto'] = this.urlFoto;
    return data;
  }
}
