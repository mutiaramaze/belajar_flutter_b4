import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/login.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/register.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/constant/app_image.dart';
import 'package:belajar_flutter_b4/all_tugas/drawerday15.dart';
import 'package:belajar_flutter_b4/all_tugas/homepage.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas2.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas8.dart';

import 'package:belajar_flutter_b4/widget/preference_handler.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Tugas8()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RegisterT15()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: Image.asset(AppImage.uvol))],
      ),
    );
  }
}
