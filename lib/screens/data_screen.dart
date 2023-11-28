import 'package:flutter/material.dart';
import 'package:flutter2/widgets/navigation_bar.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key, required this.nav, required this.page});

  final Function nav;
  final int page;

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: Center(child: Text("Data Screen")),
      bottomNavigationBar: NavBar(nav: widget.nav, page: widget.page),
    );
  }
}
