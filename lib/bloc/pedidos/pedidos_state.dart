// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'pedidos_bloc.dart';

@immutable
abstract class PedidosState {
  List<Pedido> pedidos;
  PedidosState({
    required this.pedidos,
  });
}

class PedidosCarregandoPedidosState extends PedidosState {
  PedidosCarregandoPedidosState({required super.pedidos});
}

class PedidosCarregadosState extends PedidosState {
  PedidosCarregadosState({required super.pedidos});
}

class PedidosErroState extends PedidosState {
  final String cause;
  PedidosErroState(this.cause, {required super.pedidos});
}

class PedidosInitialState extends PedidosState {
  PedidosInitialState({required super.pedidos});
}
