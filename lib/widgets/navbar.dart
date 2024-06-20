import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.selectedIndex, required this.onDestinationSelected});
final int selectedIndex;
final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        indicatorColor: Colors.blue.shade900,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60.0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.white,),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.attach_money),
            selectedIcon: Icon(Icons.attach_money, color: Colors.white,),
            label: "Painel de gastos",
          ),
        ],
      );
  }
}