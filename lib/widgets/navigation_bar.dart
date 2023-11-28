import 'package:flutter/material.dart';

// taken from Steve's class

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.nav, required this.page});

  final Function nav;
  final int page;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.apple), label: "Data"),
        NavigationDestination(icon: Icon(Icons.android), label: "Contact"),
      ],
      selectedIndex: page,
      onDestinationSelected: (int index) {
        nav(index);
      },
    );
  }
}
