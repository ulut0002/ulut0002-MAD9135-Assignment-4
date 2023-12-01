import 'dart:ffi';
import "dart:math";

import 'package:flutter/material.dart';
import 'package:flutter2/widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.nav, required this.page});

  final Function nav;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Image.asset("images/homeImage.jpeg"),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: Transform.rotate(
                angle: 15 * (pi / 180),
                child: const Text(
                  "Hello",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavBar(nav: nav, page: page),
    );
  }
}
