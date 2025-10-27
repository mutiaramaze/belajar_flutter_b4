import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';

import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/student_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/user_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/create_student.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/register.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/listdata.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas10%20Flutter/thankspage.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/drawer9.dart';
import 'package:belajar_flutter_b4/all_tugas/elevatedbutton.dart';
import 'package:belajar_flutter_b4/all_tugas/shared_preferences/preference_handler.dart';
import 'package:belajar_flutter_b4/all_tugas/widgets/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginTugas11 extends StatefulWidget {
  const LoginTugas11({super.key});
  @override
  State<LoginTugas11> createState() => _LoginTugas11State();
}

class _LoginTugas11State extends State<LoginTugas11> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildLayer()]));
  }

  // login() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => TugasSlicing()),
  //   );
  // }

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
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildTextField(
                  hintText: "Masukkan username Anda",
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username wajib diisi";
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
                      // print(passwordController.text);
                      // PreferenceHandler.saveLogin(true);
                      final data = await DbHelper.loginUser(
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                      print("Hasil dari loginUser: $data");

                      if (data != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListData()),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Email atau password salah",
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Validation Error"),
                            content: Text("Please fill all fields"),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
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
