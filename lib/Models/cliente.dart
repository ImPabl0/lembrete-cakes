import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cliente {
  final String nome;
  final String telefone;
  final String email;
  Cliente({
    required this.nome,
    required this.telefone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'telefone': telefone,
      'email': email,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);
}
