import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/list_data11.dart';
import 'package:belajar_flutter_b4/Uvol/widget/preference_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerT11 extends StatefulWidget {
  const DrawerT11({super.key});

  @override
  State<DrawerT11> createState() => _DrawerT11State();
}

class _DrawerT11State extends State<DrawerT11> {
  int _selectedIndex = 0;
  static const List<String> _titles = ["Home"];
  static const List<Widget> _widgetOptions = [ListData11()];
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
