// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Responsive/responsive.dart';

import '../../Models/pedido.dart';

class CardPedido extends StatelessWidget {
  final Pedido pedido;
  const CardPedido({
    Key? key,
    required this.pedido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return Flexible(
        child: Container(
      margin: EdgeInsets.only(bottom: responsive.altura * 0.015),
      padding: EdgeInsets.symmetric(horizontal: responsive.largura * 0.03),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: const Color(0xFFE5E2E1))),
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
            margin: EdgeInsets.only(left: responsive.largura * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pedido.cliente.nome,
                  style: TextStyle(
                      fontSize: responsive.fractional * 1.5,
                      color: const Color(0xFF493A33)),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Icon(
                        Icons.schedule,
                        size: responsive.fractional * 1.5,
                        color: const Color(0xFF493A33),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.only(left: responsive.largura * 0.01),
                          child: Text(pedido.dataDaEntrega.horaFormatada)),
                    ),
                  ],
                )
              ],
            ),
          )),
          Icon(
            Icons.info_outline,
            color: const Color(0xFFE4A8AB),
          )
        ],
      ),
    ));
  }
}
