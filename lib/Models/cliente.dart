import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cliente {
  final int id;
  final String nome;
  final String telefone;
  final String email;
  Cliente({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
  });

  Cliente copyWith({
    int? id,
    String? nome,
    String? telefone,
    String? email,
  }) {
    return Cliente(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'] as int,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      email: map['email'] as String,
    );
  }
  factory Cliente.fromSQLite(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cliente(id: $id, nome: $nome, telefone: $telefone, email: $email)';
  }

  @override
  bool operator ==(covariant Cliente other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.telefone == telefone &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ telefone.hashCode ^ email.hashCode;
  }
}
