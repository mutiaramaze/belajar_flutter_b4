import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/tugas9.dart';
import 'package:flutter/material.dart';

class DrawerTugas9 extends StatefulWidget {
  const DrawerTugas9({super.key});

  @override
  State<DrawerTugas9> createState() => _DrawerTugas9State();
}

class _DrawerTugas9State extends State<DrawerTugas9> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    Tugas9(),
    TugasKe9(),
    Tugass9(),
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
        title: Text("Tugas 9 Flutter"),
        backgroundColor: Color.fromARGB(255, 137, 154, 253),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Tugas 9")),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.check_box),
              title: Text("List view list"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.swipe),
              title: Text("List view map"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.arrow_drop_down),
              title: Text("List view model"),
            ),
            Divider(),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
