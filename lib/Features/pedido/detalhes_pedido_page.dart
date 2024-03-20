import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/Styles/color_pallet.dart';
import 'package:lembrete_cakes/Styles/text_styles.dart';
import 'package:lembrete_cakes/Utils/utils.dart';
part 'components/detail_info.dart';

class DetalhesPedidoPage extends StatelessWidget {
  final Pedido pedido;
  const DetalhesPedidoPage({super.key, required this.pedido});

  void _downloadComprovante() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pedido #${pedido.id}",
                    style: CustomTextStyles.pinkBigTitle.copyWith(fontSize: 30),
                  ),
                  const Text(
                    'Comprovante gerado automaticamente',
                    style: TextStyle(color: grey, height: 1, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      pedido.dataDoPedido.dataDetalhada,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                _DetailInfo(
                  title: "Cliente",
                  value: pedido.cliente?.nome ?? "Nome inválido",
                ),
                const SizedBox(
                  height: 5,
                ),
                _DetailInfo(
                    title: "Valor do pedido",
                    value: pedido.orcamentoDoPedido.toBRL),
                const SizedBox(
                  height: 5,
                ),
                _DetailInfo(
                    title: "Data de entrega",
                    value: pedido.dataDaEntrega.dataFormatada),
                const SizedBox(
                  height: 5,
                ),
                const _DetailInfo(title: "Empresa", value: "Memorar"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Observações",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 36,
            child: Row(
              children: [
                CancelButton(
                  text: "Cancelar",
                  onTap: () => Navigator.maybePop(context),
                ),
                const SizedBox(
                  width: 10,
                ),
                ActionButton(
                  text: "Baixar comprovante",
                  onTap: _downloadComprovante,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CancelButton({
    required this.onTap,
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 3, color: Colors.black.withOpacity(0.3))
            ]),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFEF3A3A),
              fontWeight: FontWeight.w600),
        ),
      ),
    ));
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const ActionButton({
    required this.onTap,
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFE4A8AB),
            boxShadow: [
              BoxShadow(blurRadius: 3, color: Colors.black.withOpacity(0.3))
            ]),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF514039),
              fontWeight: FontWeight.w600),
        ),
      ),
    ));
  }
}
