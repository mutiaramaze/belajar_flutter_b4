import 'package:belajar_flutter_b4/all_tugas/elevatedbutton.dart';
import 'package:belajar_flutter_b4/all_tugas/homepage.dart';
import 'package:belajar_flutter_b4/all_tugas/textfield.dart';
import 'package:belajar_flutter_b4/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TugasSlicing extends StatefulWidget {
  const TugasSlicing({super.key});

  @override
  State<TugasSlicing> createState() => _TugasSlicingState();
}

class _TugasSlicingState extends State<TugasSlicing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00224F),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 120),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Hello Welcome Back",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Welcome back please",
            style: TextStyle(color: Colors.grey[300]),
          ),
          Text("sign in again", style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(20)),

                customTextField(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                customTextField(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(300, 45),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
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

                SizedBox(height: 50),

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
                        style: TextStyle(color: Colors.white, fontSize: 15),
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

                ButtonWidget(
                  image: "assets/images/facebook.png",
                  text: "Facebook",
                ),
                ButtonWidget(image: "assets/images/google.png", text: "Gmail"),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 207, 207, 207),
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
        ],
      ),
    );
  }
}
