// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class PedidoDTO {
  int id;
  int id_cliente;
  String data_pedido;
  String data_entrega;
  int id_produto;
  String descricao;
  String referencia;
  int id_forma_de_pagamento;
  double orcamento_do_pedido;
  double quantidade;
  String status;
  PedidoDTO({
    required this.id,
    required this.id_cliente,
    required this.data_pedido,
    required this.data_entrega,
    required this.id_produto,
    required this.descricao,
    required this.referencia,
    required this.id_forma_de_pagamento,
    required this.orcamento_do_pedido,
    required this.quantidade,
    required this.status,
  });

  PedidoDTO copyWith({
    int? id,
    int? id_cliente,
    String? data_pedido,
    String? data_entrega,
    int? id_produto,
    String? descricao,
    String? referencia,
    int? id_forma_de_pagamento,
    double? orcamento_do_pedido,
    double? quantidade,
    String? status,
  }) {
    return PedidoDTO(
      id: id ?? this.id,
      id_cliente: id_cliente ?? this.id_cliente,
      data_pedido: data_pedido ?? this.data_pedido,
      data_entrega: data_entrega ?? this.data_entrega,
      id_produto: id_produto ?? this.id_produto,
      descricao: descricao ?? this.descricao,
      referencia: referencia ?? this.referencia,
      id_forma_de_pagamento:
          id_forma_de_pagamento ?? this.id_forma_de_pagamento,
      orcamento_do_pedido: orcamento_do_pedido ?? this.orcamento_do_pedido,
      quantidade: quantidade ?? this.quantidade,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_cliente': id_cliente,
      'data_pedido': data_pedido,
      'data_entrega': data_entrega,
      'id_produto': id_produto,
      'descricao': descricao,
      'referencia': referencia,
      'id_forma_de_pagamento': id_forma_de_pagamento,
      'orcamento_do_pedido': orcamento_do_pedido,
      'quantidade': quantidade,
      'status': status,
    };
  }

  factory PedidoDTO.fromMap(Map<String, dynamic> map) {
    return PedidoDTO(
      id: map['id'] as int,
      id_cliente: map['id_cliente'] as int,
      data_pedido: map['data_pedido'] as String,
      data_entrega: map['data_entrega'] as String,
      id_produto: map['id_produto'] as int,
      descricao: map['descricao'] as String,
      referencia: map['referencia'] as String,
      id_forma_de_pagamento: map['id_forma_de_pagamento'] as int,
      orcamento_do_pedido: map['orcamento_do_pedido'] as double,
      quantidade: map['quantidade'] as double,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PedidoDTO.fromJson(String source) =>
      PedidoDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PedidoDTO(id: $id, id_cliente: $id_cliente, data_pedido: $data_pedido, data_entrega: $data_entrega, id_produto: $id_produto, descricao: $descricao, referencia: $referencia, id_forma_de_pagamento: $id_forma_de_pagamento, orcamento_do_pedido: $orcamento_do_pedido, quantidade: $quantidade, status: $status)';
  }

  @override
  bool operator ==(covariant PedidoDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.id_cliente == id_cliente &&
        other.data_pedido == data_pedido &&
        other.data_entrega == data_entrega &&
        other.id_produto == id_produto &&
        other.descricao == descricao &&
        other.referencia == referencia &&
        other.id_forma_de_pagamento == id_forma_de_pagamento &&
        other.orcamento_do_pedido == orcamento_do_pedido &&
        other.quantidade == quantidade &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        id_cliente.hashCode ^
        data_pedido.hashCode ^
        data_entrega.hashCode ^
        id_produto.hashCode ^
        descricao.hashCode ^
        referencia.hashCode ^
        id_forma_de_pagamento.hashCode ^
        orcamento_do_pedido.hashCode ^
        quantidade.hashCode ^
        status.hashCode;
  }
}
