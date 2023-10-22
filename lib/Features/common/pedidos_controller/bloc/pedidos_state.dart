// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pedidos_bloc.dart';

@immutable
abstract class PedidosState {
  List<Pedido> pedidos;
  PedidosState({
    required this.pedidos,
  });
}

class PedidosInitial extends PedidosState {
  PedidosInitial({required super.pedidos});
}
