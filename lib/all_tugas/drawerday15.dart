import 'package:belajar_flutter_b4/all_tugas/tugas2.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas5.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas1.dart';
import 'package:flutter/material.dart';

class DrawerWidgetDay15 extends StatefulWidget {
  const DrawerWidgetDay15({super.key});

  @override
  State<DrawerWidgetDay15> createState() => _DrawerWidgetDay15State();
}

class _DrawerWidgetDay15State extends State<DrawerWidgetDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    Tugas1(),
    Tugas2(),
    Tugas5(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/mogu.jpg"),
              ),
              title: Text("Mogu"),
              subtitle: Text("Drink"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.shopping_cart_checkout_outlined),
              title: Text("Basket"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.payment),
              title: Text("Payment"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
