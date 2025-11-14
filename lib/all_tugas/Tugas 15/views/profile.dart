import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/edit.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/login.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/views/register.dart';
import 'package:belajar_flutter_b4/widget/preference_handler.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas 15/models/get_profile.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas 15/service/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? profile;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      final token = await PreferenceHandler.getToken();
      final result = await AuthAPI.getProfile(token);

      setState(() {
        profile = result;
        isLoading = false;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Token invalid, silakan login ulang");
      await PreferenceHandler.removeLogin();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RegisterT15()),
      );
    }
  }

  Future<void> logout() async {
    await PreferenceHandler.removeLogin();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginT15()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (profile == null) {
      return Scaffold(body: Center(child: Text("Gagal memuat profil")));
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue[200],
              // backgroundImage: AssetImage("assets/images/profile.png"),
            ),

            SizedBox(height: 16),

            Text(
              profile!.data!.name ?? "",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 4),

            Text(
              profile!.data!.email.toString(),
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),

            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  PreferenceHandler.removeLogin();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginT15()),
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
