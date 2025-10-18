import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  const customTextField({super.key, this.hintText, this.prefixIcon});

  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        border: UnderlineInputBorder(),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
