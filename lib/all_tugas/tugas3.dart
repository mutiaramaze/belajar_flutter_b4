import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Formulir Pengguna",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],

          Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),

          Text("Nama"),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2),
              border: OutlineInputBorder(),
              hintText: "Masukkan Nama Anda",
            ),
          ),
          SizedBox(height: 10),

          Text("Email"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Masukkan Email Anda",
            ),
          ),
          SizedBox(height: 10),

          Text("No Handphone"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Masukkan No Handphone Anda",
            ),
          ),
          SizedBox(height: 10),

          Text("Deskripsi"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Masukkan Deskripsi Anda",
            ),
          ),
        ),
      ),
    );
  }
}
