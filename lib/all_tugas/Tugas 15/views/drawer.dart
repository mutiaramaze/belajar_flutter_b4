import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/list_data11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/profile.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/register.dart';

import 'package:belajar_flutter_b4/widget/preference_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerT15 extends StatefulWidget {
  const DrawerT15({super.key});

  @override
  State<DrawerT15> createState() => _DrawerT11State();
}

class _DrawerT11State extends State<DrawerT15> {
  int _selectedIndex = 0;
  static const List<String> _titles = ["Profile", "List data"];
  static const List<Widget> _widgetOptions = [ProfilePage(), ListData11()];
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
        backgroundColor: const Color.fromARGB(255, 87, 104, 141),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Tugas 11 Flutter")),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("Profile"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("List data"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterT15()),
                  (route) => false,
                );
              },
              leading: Icon(Icons.outbond),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
