import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Produto {
  String nome;
  String descricao;
  Produto({
    required this.nome,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
