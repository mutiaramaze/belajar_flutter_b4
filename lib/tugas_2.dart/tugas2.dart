import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 240, 253),
      appBar: AppBar(
        title: Text("Profil Lengkap"),
        backgroundColor: const Color.fromARGB(255, 235, 214, 250),
      ),

      body: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "Rizni Mutiara Farannita",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.mail_outline, size: 15, color: Colors.red),
              Text("riznimutiara.f@gmail.com", style: TextStyle(fontSize: 15)),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.smartphone, size: 15, color: Colors.red),
              Text("081210982177", style: TextStyle(fontSize: 15)),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //baris 4
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("5"), Text("Postingan")],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("751"), Text("Followers")],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
