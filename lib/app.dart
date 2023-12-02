import 'package:flutter/material.dart';
import 'package:flutter2/screens/contact_screen.dart';
import 'package:flutter2/screens/data_screen.dart';
import 'package:flutter2/screens/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  void nav(int page) {
    setState(() {
      currentPage = page;
    });
  }

  Widget loadPage() {
    Widget screen;
    switch (currentPage) {
      case 0:
        screen = HomeScreen(nav: nav, page: currentPage);
      case 1:
        screen = DataScreen(nav: nav, page: currentPage);
      case 2:
        screen = ContactScreen(
          nav: nav,
          page: currentPage,
          scaffoldKey: _scaffoldKey,
        );
      default:
        throw Exception("This page does not exist");
    }
    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      home: loadPage(),
    );
  }
}
