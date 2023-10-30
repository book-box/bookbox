class UserDatabase {
  final String idUsuario;
  final String nome;
  final String email;

  const UserDatabase({
    required this.idUsuario,
    required this.nome,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'email': email,
    };
  }

  @override
  String toString() => 'UserDatabase(idUsuario: $idUsuario, nome: $nome, email: $email)';
}
