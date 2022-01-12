import 'package:flutter/material.dart';
import 'package:meuspacientes/views/consultation_list_page.dart';

import 'customer_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    //HomePage(),
    CustomerListPage(),
    ConsulationListPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Home")),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Pacientes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule), label: "Consultas"),
          ]),
    );
  }
}
