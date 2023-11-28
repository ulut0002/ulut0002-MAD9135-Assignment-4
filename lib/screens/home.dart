import 'package:flutter/material.dart';
import 'package:flutter2/widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.nav, required this.page});

  final Function nav;
  final int page;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(child: Text("Home Screen")),
      bottomNavigationBar: NavBar(nav: widget.nav, page: widget.page),
    );
  }
}
