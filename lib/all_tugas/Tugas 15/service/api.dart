import 'dart:convert';
import 'dart:developer';

import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/constant/endpoint.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/models/get_profile.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/models/login_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2015/models/register_model.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    print(response.body);
    print(response.statusCode);

    final jsonData = json.decode(response.body);

    if (jsonData["message"] != "Login berhasil") {
      throw Exception(jsonData["message"]);
    }

    return LoginModel.fromJson(jsonData);
  }

  static Future<ProfileModel> getProfile(String token) async {
    final url = Uri.parse(Endpoint.getprofile);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    final jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonResponse);
    } else {
      throw Exception(jsonResponse["message"]);
    }
  }
}
