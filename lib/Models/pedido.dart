// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:lembrete_cakes/Models/cliente.dart';
import 'package:lembrete_cakes/Models/enum/status_pedido.dart';
import 'package:lembrete_cakes/Models/produto.dart';

import 'forma_de_pagamento.dart';

class Pedido {
  Cliente? cliente;
  Produto? produto;
  double quantidade;
  DateTime dataDoPedido;
  DateTime dataDaEntrega;
  String descricao;
  String referencia;
  double orcamentoDoPedido;

  StatusPedido status;

  FormaDePagamento? formaDePagamento;
  Pedido({
    required this.cliente,
    required this.produto,
    required this.quantidade,
    required this.dataDoPedido,
    required this.dataDaEntrega,
    required this.descricao,
    required this.referencia,
    required this.orcamentoDoPedido,
    required this.status,
    required this.formaDePagamento,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cliente': cliente?.toMap(),
      'produto': produto?.toMap(),
      'quantidade': quantidade,
      'dataDoPedido': dataDoPedido.millisecondsSinceEpoch,
      'dataDaEntrega': dataDaEntrega.millisecondsSinceEpoch,
      'descricao': descricao,
      'referencia': referencia,
      'orcamentoDoPedido': orcamentoDoPedido,
      'status': status.name,
      'formaDePagamento': formaDePagamento?.toMap(),
    };
  }

  Map<String, dynamic> toSQLite() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      'id_cliente': cliente?.id,
      'id_produto': produto?.toMap(),
      'quantidade': quantidade,
      'data_pedido': dateFormat.format(dataDoPedido),
      'data_entrega': dateFormat.format(dataDoPedido),
      'descricao': descricao,
      'referencia': referencia,
      'orcamento_do_pedido': orcamentoDoPedido,
      'status': status.name,
      'id_forma_de_pagamento': formaDePagamento?.id,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return Pedido(
      cliente: Cliente.fromMap(map['cliente'] as Map<String, dynamic>),
      produto: Produto.fromSQLite(map['produto'] as Map<String, dynamic>),
      quantidade: map['quantidade'] as double,
      dataDoPedido: dateFormat.parse(map['dataDoPedido']),
      dataDaEntrega: dateFormat.parse(map['dataDaEntrega']),
      descricao: map['descricao'] as String,
      referencia: map['referencia'] as String,
      orcamentoDoPedido: map['orcamentoDoPedido'] as double,
      status: StatusPedido.values
          .firstWhere((element) => element.name == map['status']),
      formaDePagamento: FormaDePagamento.fromMap(
          map['formaDePagamento'] as Map<String, dynamic>),
    );
  }
  factory Pedido.fromSQLite(Map<String, dynamic> map) {
    ///Todos os parâmetros setados como [null] precisam ser setados posteriormente.
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return Pedido(
      cliente: null,
      produto: null,
      quantidade: map['quantidade'],
      dataDoPedido: dateFormat.parse(map['data_pedido']),
      dataDaEntrega: dateFormat.parse(map['data_entrega']),
      descricao: map['descricao'],
      referencia: map['referencia'],
      orcamentoDoPedido: map['orcamento_do_pedido'],
      status: StatusPedido.values
          .firstWhere((element) => element.name == map['status']),
      formaDePagamento: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) =>
      Pedido.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension DateExtension on DateTime {
  String get horaFormatada {
    String string = toString();
    return string.split(" ").last.substring(0, 5);
  }

  String get dataFormatada {
    return DateFormat("dd/MM/yyyy").format(this);
  }
}
