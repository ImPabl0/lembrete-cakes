import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FormaDePagamento {
  int id;
  String nome;
  FormaDePagamento({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
    };
  }

  factory FormaDePagamento.fromMap(Map<String, dynamic> map) {
    return FormaDePagamento(
      id: map['id'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormaDePagamento.fromJson(String source) =>
      FormaDePagamento.fromMap(json.decode(source) as Map<String, dynamic>);
}
