// import 'package:belajar_flutter_b4/all_tugas/Tugas10%20Flutter/tugas10.dart';
// import 'package:flutter/material.dart';

// class Thankspage extends StatefulWidget {
//   const Thankspage({super.key});

//   @override
//   State<Thankspage> createState() => _ThankspageState();
// }

// class _ThankspageState extends State<Thankspage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   Tugas10()
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [Text("Terimakasih, ${nameController.text}")]),
//     );
//   }
// }

import 'package:belajar_flutter_b4/all_tugas/Tugas10%20Flutter/tugas10.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Thankspage extends StatefulWidget {
  const Thankspage({super.key, required this.name, required this.city});
  final String name;
  final String city;
  @override
  State<Thankspage> createState() => _ThankspageState();
}

class _ThankspageState extends State<Thankspage> {
  static const List<Widget> _widgetOptions = [Tugas10()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Terimakasih ${widget.name} dari ${widget.city} telah mendaftar",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
