import 'dart:convert';

import 'package:lembrete_cakes/Models/produto_caracteristica.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Produto {
  int id;
  String nome;
  String descricao;
  List<ProdutoCaracteristica> caracteristicas;
  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.caracteristicas,
  });

  Produto copyWith({
    int? id,
    String? nome,
    String? descricao,
    List<ProdutoCaracteristica>? caracteristicas,
  }) {
    return Produto(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      caracteristicas: caracteristicas ?? this.caracteristicas,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory Produto.fromSQLite(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] as int,
      nome: map['nome'] as String,
      caracteristicas: [],
      descricao: map['descricao_produto'] as String,
    );
  }
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] as int,
      nome: map['nome'] as String,
      caracteristicas: [], // Caso implemente conexão externa para receber os produtos isso deve ser mapeado corretamente.
      descricao: map['descricao_produto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromSQLite(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Produto(id: $id, nome: $nome, descricao: $descricao)';

  @override
  bool operator ==(covariant Produto other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ descricao.hashCode;
}
