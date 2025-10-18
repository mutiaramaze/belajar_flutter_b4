import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 5, 56, 99),
        minimumSize: Size(500, 40),
      ),
      onPressed: () {
        print("Tekan sekali");
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 20),
          SizedBox(width: 10),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
