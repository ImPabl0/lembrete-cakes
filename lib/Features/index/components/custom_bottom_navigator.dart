import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Widget page;
  final bool shouldNavigateTo;
  const MenuItem(
      {required this.name,
      required this.icon,
      required this.page,
      this.shouldNavigateTo = false});
}

class CustomBottomNavigator extends StatefulWidget {
  final List<MenuItem> itensMenu;
  final PageController pageController;
  const CustomBottomNavigator({
    Key? key,
    required this.itensMenu,
    required this.pageController,
  }) : super(key: key);

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  MenuItem? currentSelectedItem;

  @override
  void initState() {
    selectFirstItem();
    super.initState();
  }

  void selectFirstItem() {
    try {
      currentSelectedItem = widget.itensMenu.first;
    } catch (e) {
      currentSelectedItem = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
              color: Color(0xFFE4A8AB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(19))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.itensMenu.length, (index) {
              MenuItem itemAtual = widget.itensMenu[index];
              Color currentColor = itemAtual == currentSelectedItem
                  ? Colors.white
                  : const Color(0xFF503B3C);
              return Flexible(
                child: InkWell(
                  onTap: () {
                    widget.pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.decelerate);
                    setState(() {
                      currentSelectedItem = itemAtual;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        itemAtual.icon,
                        color: currentColor,
                      ),
                      Text(
                        itemAtual.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: currentColor),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
