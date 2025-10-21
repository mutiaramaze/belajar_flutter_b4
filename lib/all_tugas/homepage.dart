import 'package:belajar_flutter_b4/all_tugas/tugas4.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas5.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        // automaticallyImplyLeading: false,
        // leading: Icon(Icons.home),
      ),

      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Login"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas5()),
                );
              },
              child: Text("Its tugas 5"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas4()),
                  (route) => false,
                );
              },
              child: Text("Its tugas 4"),
            ),
          ),
        ],
      ),
    );
  }
}
