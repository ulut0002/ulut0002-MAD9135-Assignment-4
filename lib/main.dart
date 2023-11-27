import 'package:flutter/material.dart';
import 'package:flutter2/screens/contact_screen.dart';
import 'package:flutter2/screens/data_screen.dart';
import 'package:flutter2/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    DataScreen(),
    ContactScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "": (context) => const HomeScreen(),
        "/data": (context) => const DataScreen(),
        "/contact": (context) => const ContactScreen()
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
      ),
      home: Scaffold(
        // appBar: AppBar(),
        body: pages[pageIndex],
        bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.apple), label: "Data"),
              NavigationDestination(icon: Icon(Icons.android), label: "Contact")
            ],
            selectedIndex: pageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                pageIndex = index;
              });
            }),
      ),
    );
  }
}
