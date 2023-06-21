// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:lembrete_cakes/Models/cliente.dart';
import 'package:lembrete_cakes/Models/produto.dart';

class Pedido {
  final Cliente cliente;
  final Produto produto;
  DateTime dataDoPedido;
  DateTime dataDaEntrega;
  Pedido({
    required this.cliente,
    required this.produto,
    required this.dataDoPedido,
    required this.dataDaEntrega,
  });
}

extension DateExtension on DateTime {
  String get horaFormatada {
    String string = toString();
    return string.split(" ").last.substring(0, 5);
  }
}
