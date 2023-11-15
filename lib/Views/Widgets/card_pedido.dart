// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../Models/pedido.dart';

class CardPedido extends StatelessWidget {
  final Pedido pedido;
  const CardPedido({
    Key? key,
    required this.pedido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(width: 2, color: const Color(0xFFE5E2E1))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE4A8AB)))),
          Flexible(
              child: Container(
            margin: const EdgeInsets.only(left: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pedido.cliente?.nome ?? "",
                  style:
                      const TextStyle(fontSize: 15, color: Color(0xFF493A33)),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: const Icon(
                        Icons.calendar_month,
                        size: 15,
                        color: Color(0xFF493A33),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                              "Prazo até ${pedido.dataDaEntrega.dataFormatada}")),
                    ),
                  ],
                )
              ],
            ),
          )),
          const Icon(
            Icons.info_outline,
            color: Color(0xFFE4A8AB),
          )
        ],
      ),
    );
  }
}
