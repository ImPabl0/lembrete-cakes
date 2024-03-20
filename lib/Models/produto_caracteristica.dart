// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lembrete_cakes/Models/enum/tipo_caracteristica.dart';

///Representa o atributo de um produto, ex: Sabor, cor, tamanho e etc.
///Pertence a tabela "caracteristica"
class ProdutoCaracteristica {
  int? id;
  String nome;
  int idProduto;
  TipoCaracteristica? tipoCaracteristica;
  ProdutoCaracteristica({
    this.id,
    required this.nome,
    required this.idProduto,
    this.tipoCaracteristica,
  });

  ProdutoCaracteristica copyWith(
      {int? id,
      String? nome,
      int? idProduto,
      TipoCaracteristica? tipoCaracteristica}) {
    return ProdutoCaracteristica(
      id: id ?? this.id,
      tipoCaracteristica: tipoCaracteristica ?? this.tipoCaracteristica,
      nome: nome ?? this.nome,
      idProduto: idProduto ?? this.idProduto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'id_produto': idProduto,
    };
  }

  factory ProdutoCaracteristica.fromMap(Map<String, dynamic> map) {
    return ProdutoCaracteristica(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      idProduto: map['id_produto'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoCaracteristica.fromJson(String source) =>
      ProdutoCaracteristica.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProdutoCaracteristica(id: $id, nome: $nome, id_produto: $idProduto)';

  @override
  bool operator ==(covariant ProdutoCaracteristica other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.idProduto == idProduto;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ idProduto.hashCode;
}
