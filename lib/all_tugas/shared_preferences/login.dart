import 'package:belajar_flutter_b4/all_tugas/Tugas10%20Flutter/thankspage.dart';
import 'package:belajar_flutter_b4/all_tugas/shared_preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class LoginSharedPreferences extends StatefulWidget {
  const LoginSharedPreferences({super.key});
  static const id = "/login_screen18";
  @override
  State<LoginSharedPreferences> createState() => _LoginSharedPreferencesState();
}

class _LoginSharedPreferencesState extends State<LoginSharedPreferences> {
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
                  "Welcome ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                height(12),
                Text("Login to access your account"),

                height(24),

                height(12),
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
                height(16),

                height(12),
                Row(
                  children: [
                    Text(
                      "Domisili",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildTextField(
                  hintText: "Masukkan domisili Anda",

                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Domisili wajib diisi";
                    }
                    return null;
                  },
                ),

                height(50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(300, 45),
                  ),
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      color: (Color(0xFF00224F)),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      PreferenceHandler.saveLogin(true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Thankspage(
                            name: nameController.text,
                            city: cityController.text,
                          ),
                        ),
                      );
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
                                onPressed: () {},
                              ),
                            ],
                          );
                        },
                      );
                    } else {}
                  },
                ),

                SizedBox(height: 20),

                Container(
                  width: 322,
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 0.5,
                          color: const Color.fromARGB(255, 223, 223, 223),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "or",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 153, 151, 151),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 14, 13, 13),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
