import 'package:flutter/material.dart';

class TesAplikasi extends StatefulWidget {
  const TesAplikasi({super.key});

  @override
  State<TesAplikasi> createState() => _TesAplikasiState();
}

class _TesAplikasiState extends State<TesAplikasi> {
  static String customFont = 'Eagle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EFE6),
      body: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.all(15)),
          ListTile(
            title: Text(
              "Hello",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            subtitle: Text(
              "Let's volunteering with us",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Divider(),

          SizedBox(height: 20),
          Icon(
            Icons.handshake,
            color: const Color.fromARGB(255, 156, 83, 107),
            size: 50,
          ),
          SizedBox(height: 50),
          Text(
            "UVol",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: customFont,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Developed by R Mutiara Farannita, Uvol is an application designed to help people in Indonesia easily find volunteer opportunities.",
            ),
          ),

          Spacer(),
          Text("0.0.1"),
          Text("Version"),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
