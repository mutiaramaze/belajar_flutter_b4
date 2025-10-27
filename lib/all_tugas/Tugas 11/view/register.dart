import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/user_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/elevatedbutton.dart';
import 'package:belajar_flutter_b4/all_tugas/shared_preferences/preference_handler.dart';
import 'package:belajar_flutter_b4/all_tugas/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Bahas Shared Preference
class RegisterT11 extends StatefulWidget {
  const RegisterT11({super.key});
  static const id = "/register";
  @override
  State<RegisterT11> createState() => _RegisterT11State();
}

class _RegisterT11State extends State<RegisterT11> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  // register() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => HomeScreenDay15()),
  //   );
  // }

  final _formKey = GlobalKey<FormState>();
  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                height(8),
                Text(
                  "Register to access your account",
                  // style: TextStyle(fontSize: 14, color: AppColor.gray88),
                ),

                height(16),
                buildTitle("Name"),
                height(12),
                buildTextField(
                  hintText: "Enter your Name",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                buildTitle("Username"),
                height(12),
                buildTextField(
                  hintText: "Make your username",
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                buildTitle("Email Address"),
                height(12),
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

                buildTitle("Password"),
                height(12),
                buildTextField(
                  hintText: "Enter your password",
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else if (value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
                ),
                height(20),
                LoginButton(
                  text: "Register",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      final UserModel data = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                      DbHelper.registerUser(data);
                      Fluttertoast.showToast(msg: "Register Berhasil");
                      PreferenceHandler.saveLogin(true);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginTugas11()),
                      );
                    }
                  },
                ),

                height(16),

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginTugas11(),
                          ),
                        );
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

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/background.png"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
