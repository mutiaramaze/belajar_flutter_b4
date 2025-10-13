import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: const Color.fromARGB(255, 2, 116, 209),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start, // start
        mainAxisAlignment: MainAxisAlignment.center, // center
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Bonjour!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("Rizni Mutiara Farannita", style: TextStyle(fontSize: 20)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 25, color: Colors.red),
              Text("Jakarta", style: TextStyle(fontSize: 20)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Saat ini saya sedang belajar flutter",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),

          // Text("S"),
          // Text("A"),
        ],
      ),
    );
  }
}
