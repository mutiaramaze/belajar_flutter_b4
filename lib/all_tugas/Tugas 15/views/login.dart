import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/drawerT11.dart';

import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/student_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/user_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/list_data11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/register.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/service/api.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/drawer.dart';

import 'package:belajar_flutter_b4/all_tugas/Tugas10%20Flutter/thankspage.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/drawer9.dart';
import 'package:belajar_flutter_b4/all_tugas/elevatedbutton.dart';

import 'package:belajar_flutter_b4/all_tugas/widgets/login_button.dart';
import 'package:belajar_flutter_b4/widget/preference_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginT15 extends StatefulWidget {
  const LoginT15({super.key});
  @override
  State<LoginT15> createState() => _LoginT15State();
}

class _LoginT15State extends State<LoginT15> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildLayer()]));
  }

  final _formKey = GlobalKey<FormState>();
  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Center(
            child: Column(
              children: [
                height(10),
                Text(
                  "Uvol ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                height(12),
                Text("Login to access your account"),

                height(24),

                Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildTextField(
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else if (!value.contains('@')) {
                      return "Email tidak valid";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(value)) {
                      return "Format Email tidak valid";
                    }
                    return null;
                  },
                ),

                height(12),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildTextField(
                  hintText: "Masukkan password Anda",
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password wajib diisi";
                    }
                    return null;
                  },
                ),

                height(30),

                LoginButton(
                  text: "Login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final data = await AuthAPI.loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        PreferenceHandler.saveToken(data.data!.token!);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DrawerT15()),
                        );
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,

    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
