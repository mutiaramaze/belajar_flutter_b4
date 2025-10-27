import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/tugas9.dart';
import 'package:flutter/material.dart';

class DrawerTugas11 extends StatefulWidget {
  const DrawerTugas11({super.key});

  @override
  State<DrawerTugas11> createState() => _DrawerTugas11State();
}

class _DrawerTugas11State extends State<DrawerTugas11> {
  int _selectedIndex = 0;
  static const List<String> _titles = [
    //  Tugas9(),
    //  TugasKe9(),
    //  Tugass9(),
    "List View List",
    "List View Map",
    "List View Model",
  ];

  static const List<Widget> _widgetOptions = [];
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
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Color.fromARGB(255, 137, 154, 253),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Tugas 11 ")),
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

            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.arrow_back_outlined),
              title: Text("CR Widget"),
            ),
            Divider(),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
