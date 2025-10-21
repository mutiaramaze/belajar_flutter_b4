import 'package:belajar_flutter_b4/all_tugas/tugas7/tugas7.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DrawerWidgetDay16 extends StatefulWidget {
  const DrawerWidgetDay16({super.key});

  @override
  State<DrawerWidgetDay16> createState() => _DrawerWidgetDay16State();
}

class _DrawerWidgetDay16State extends State<DrawerWidgetDay16> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    Checked(),
    Switched(),
    Dropdown(),
    DatePicker(),
    TimePicker(),
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
      appBar: AppBar(
        title: Text("Tugas 7 Flutter"),
        backgroundColor: Color(0xFFF5EFE6),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Tugas 7")),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.check_box),
              title: Text("Syarat & Ketentuan"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.swipe),
              title: Text("Mode gelap"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.arrow_drop_down),
              title: Text("Kategori produk"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.date_range),
              title: Text("Tanggal lahir"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.timelapse_outlined),
              title: Text("Atur pengingat"),
            ),
            Divider(),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
