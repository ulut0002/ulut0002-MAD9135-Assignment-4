import 'package:flutter/material.dart';
import 'package:flutter2/widgets/navigation_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.nav, required this.page});
  final Function nav;
  final int page;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: Center(child: Text("Contact Screen")),
      bottomNavigationBar: NavBar(nav: widget.nav, page: widget.page),
    );
  }
}
