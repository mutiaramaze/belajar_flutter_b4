import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/shared_preferences/login.dart';
import 'package:belajar_flutter_b4/Uvol/widget/preference_handler.dart';
import 'package:belajar_flutter_b4/all_tugas/shared_preferences/splash_screen.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas5.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPreference extends StatefulWidget {
  const DrawerPreference({super.key});

  @override
  State<DrawerPreference> createState() => _DrawerPreferenceState();
}

class _DrawerPreferenceState extends State<DrawerPreference> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Tugas5(),
    LoginSharedPreferences(),
    SplashScreen(),
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
