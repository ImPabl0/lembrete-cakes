// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lembrete_cakes/Models/cliente.dart';

class Endereco {
  int id;
  String? bairro;
  String? logradouro;
  String? numero;
  String? cidade;
  String? estado;
  Cliente? cliente;
  Endereco({
    required this.id,
    this.bairro,
    this.logradouro,
    this.numero,
    this.cidade,
    this.estado,
    this.cliente,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bairro': bairro,
      'logradouro': logradouro,
      'numero': numero,
      'cidade': cidade,
      'estado': estado,
      'cliente': cliente?.toMap(),
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      id: map['id'] as int,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      logradouro:
          map['logradouro'] != null ? map['logradouro'] as String : null,
      numero: map['numero'] != null ? map['numero'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      cliente: map['cliente'] != null
          ? Cliente.fromMap(map['cliente'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);
}
