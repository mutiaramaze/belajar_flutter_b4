import 'package:belajar_flutter_b4/all_tugas/drawerday15.dart';
import 'package:belajar_flutter_b4/all_tugas/homepage.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas4.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas7/drawer.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas1.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    DrawerWidgetDay15(),
    Tugas1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tentang aplikasi",
          ),
        ],
      ),
    );
  }
}
