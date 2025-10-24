import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/drawer11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas10%20Flutter/thankspage.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/drawer9.dart';
import 'package:belajar_flutter_b4/all_tugas/elevatedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tugass11 extends StatefulWidget {
  const Tugass11({super.key});
  @override
  State<Tugass11> createState() => _Tugass11State();
}

class _Tugass11State extends State<Tugass11> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

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
                    Text("Nama", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                buildTextField(
                  hintText: "Masukkan nama Anda",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama wajib diisi";
                    }
                    return null;
                  },
                ),

                height(12),
                Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildTextField(
                  hintText: "Masukkan email Anda",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else if (!value.contains('@')) {
                      return "Email tidak valid";
                    }
                    return null;
                  },
                ),

                height(12),
                Row(
                  children: [
                    Text(
                      "No Handphone",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildTextField(
                  hintText: "Masukkan nomor Handphone Anda",
                  controller: phoneController,
                ),

                height(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(300, 45),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: (Color(0xFF00224F)),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Data kamu"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama: ${nameController.text}"),
                                Text("Email: ${emailController.text}"),
                                Text("No Handphone: ${phoneController.text}"),
                                Text("Domisili: ${cityController.text}"),
                              ],
                            ),

                            actions: [
                              TextButton(
                                child: Text("Lanjut"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DrawerTugas11(
                                        // name: nameController.text,
                                        // city: cityController.text,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {}
                  },
                ),

                SizedBox(height: 15),

                Container(
                  width: 322,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 0.05,
                          color: const Color.fromARGB(255, 223, 223, 223),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "or",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 134, 134, 134),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          height: 0.5,
                          color: const Color.fromARGB(255, 223, 223, 223),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                ButtonWidget(image: "assets/images/google.png", text: "Gmail"),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 128, 127, 127),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Tombol teks ditekan");
                      },
                      child: Text("Sign in"),
                    ),
                  ],
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
