import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/drawer11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/view/register.dart';
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
                      return "username wajib diisi";
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
                ),

                //                  height(24),
                //                  LoginButton(text: "Login",
                //                  onPressed: ()async {
                //                    if (_formKey.currentState!validate()){
                //                     print(passwordController.text);
                // PreferenceHandler.saveLogin(true);
                // final data = await DbHelper.loginUser(username: usernameController.text, password: passwordController.text);
                // if (data != null){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterT11(),
                //    ),
                //     );
                // } else {
                //   Fluttertoast.showToast(
                //     msg: "Email atau password salah"
                //   );
                // } else {
                //   showDialog(context: context, ),
                //   TextButton(onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterT11(),
                //     ),
                //     );
                //   },)
                // }
                //                    }
                //                  },
                //                  )
                height(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(300, 45),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrawerTugas11()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: (Color(0xFF00224F)),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Container(
                //   width: 322,
                //   height: 30,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: Container(
                //           height: 0.05,
                //           color: const Color.fromARGB(255, 223, 223, 223),
                //         ),
                //       ),
                //       SizedBox(width: 5),
                //       Text(
                //         "or",
                //         style: TextStyle(
                //           color: const Color.fromARGB(255, 134, 134, 134),
                //           fontSize: 15,
                //         ),
                //       ),
                //       SizedBox(width: 5),
                //       Expanded(
                //         child: Container(
                //           height: 0.5,
                //           color: const Color.fromARGB(255, 223, 223, 223),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // SizedBox(height: 10),

                // ButtonWidget(image: "assets/images/google.png", text: "Gmail"),
                // SizedBox(height: 10),

                // SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Already have an account?",
                //       style: TextStyle(
                //         color: const Color.fromARGB(255, 128, 127, 127),
                //       ),
                //     ),
                //     TextButton(
                //       onPressed: () {
                //         print("Tombol teks ditekan");
                //       },
                //       child: Text("Sign in"),
                //     ),
                //   ],
                // ),
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
