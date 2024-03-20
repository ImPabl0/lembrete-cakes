part of '../novo_pedido_page.dart';

class _Header extends StatefulWidget {
  final PageController pageController;
  const _Header({required this.pageController});

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  int currentPage = 1;

  @override
  void initState() {
    widget.pageController.addListener(() {
      onPageChanged(widget.pageController.page!);
    });
    super.initState();
  }

  void onPageChanged(double page) {
    if (!(page % 1 == 0)) return;
    setState(() {
      currentPage = page.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Adicionar novo pedido",
          style: CustomTextStyles.pinkBigTitle,
        ),
        Text(
          "Etapa $currentPage de 3",
          style: const TextStyle(color: grey),
        ),
      ],
    );
  }
}
