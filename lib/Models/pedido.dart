// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:lembrete_cakes/Models/cliente.dart';
import 'package:lembrete_cakes/Models/enum/status_pedido.dart';
import 'package:lembrete_cakes/Models/produto.dart';

import 'forma_de_pagamento.dart';

class Pedido {
  final Cliente cliente;
  final Produto produto;
  double quantidade;
  DateTime dataDoPedido;
  DateTime dataDaEntrega;
  String descricao;
  String referencia;
  double orcamentoDoPedido;

  StatusPedido status;

  FormaDePagamento formaDePagamento;
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
}

extension DateExtension on DateTime {
  String get horaFormatada {
    String string = toString();
    return string.split(" ").last.substring(0, 5);
  }
}
