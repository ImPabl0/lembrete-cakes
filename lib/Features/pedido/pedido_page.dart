import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/Styles/text_styles.dart';
import 'package:lembrete_cakes/Views/Widgets/card_pedido.dart';

class PedidoPage extends StatelessWidget {
  const PedidoPage({
    super.key,
    required this.pedidos,
  });
  final List<Pedido> pedidos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seus pedidos',
                  style: CustomTextStyles.pinkBigTitle,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Hoje',
                    style: TextStyle(color: Color(0xFF543927)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemCount: pedidos.length,
                itemBuilder: (context, index) {
                  Pedido pedido = pedidos[index];
                  return CardPedido(pedido: pedido);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
