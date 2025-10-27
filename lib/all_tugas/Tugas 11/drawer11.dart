import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/listdata.dart';
import 'package:belajar_flutter_b4/all_tugas/shared_preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class DrawerTugas11 extends StatefulWidget {
  const DrawerTugas11({super.key});

  @override
  State<DrawerTugas11> createState() => _DrawerTugas11State();
}

class _DrawerTugas11State extends State<DrawerTugas11> {
  int _selectedIndex = 0;
  static const List<String> _titles = ["Home"];
  static const List<Widget> _widgetOptions = [ListData()];
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
        backgroundColor: Colors.brown[200],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("Home"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginTugas11()),
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
