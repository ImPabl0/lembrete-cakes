import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/Styles/input_decorations.dart';
import 'package:lembrete_cakes/Styles/text_styles.dart';
import 'package:lembrete_cakes/Features/pedido/components/card_pedido.dart';

import '../../bloc/pedidos/pedidos_bloc.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({
    super.key,
  });

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  List<Pedido> pedidos = [];

  @override
  void initState() {
    loadPedidos();
    super.initState();
  }

  late PedidosBloc pedidosBlocProvider = context.read<PedidosBloc>();
  Future<void> loadPedidos() async {
    pedidosBlocProvider.add(BuscarTodosOsPedidosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: const Text(
              'Seus pedidos',
              style: CustomTextStyles.pinkBigTitle,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              decoration: CustomInputDecorations.defaultDecoration.copyWith(
                  hintText: "Pesquise por nome",
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
          BlocBuilder<PedidosBloc, PedidosState>(
            bloc: pedidosBlocProvider,
            builder: (context, state) {
              if (state is PedidosCarregadosState && state.pedidos.isEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          height: 50, width: 50, 'assets/svgs/cupcake.svg'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                            textAlign: TextAlign.center,
                            'Nenhum pedido encontrado, faça seu primeiro agora!'),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text("Criar um pedido"))
                    ],
                  ),
                );
              }
              if (state is PedidosCarregandoPedidosState) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      itemCount: state.pedidos.length,
                      itemBuilder: (context, index) {
                        Pedido pedido = state.pedidos[index];
                        return CardPedido(pedido: pedido);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
