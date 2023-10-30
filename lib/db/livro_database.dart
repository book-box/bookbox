class LivroDatabase {
  final String idLivro;
  final String nome;
  final String autor;
  final String descricao;
  final DateTime dataPublicacao;

  const LivroDatabase({
    required this.idLivro,
    required this.nome,
    required this.autor,
    required this.descricao,
    required this.dataPublicacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'idLivro': idLivro,
      'nome': nome,
      'autor': autor,
      'descricao': descricao,
      'dataPublicacao': dataPublicacao,
    };
  }

  @override
  String toString() {
    return 'LivroDatabase(idLivro: $idLivro, nome: $nome, autor: $autor, descricao: $descricao, dataPublicacao: $dataPublicacao)';
  }
}
