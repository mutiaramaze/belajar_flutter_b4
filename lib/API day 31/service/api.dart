import 'dart:convert';
import 'package:belajar_flutter_b4/API%20day%2031/models/user_models.dart';
import 'package:http/http.dart' as http;

Future<List<GameOfThrones>> fetchGOT() async {
  final response = await http.get(
    Uri.parse("https://thronesapi.com/api/v2/Characters"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body);
    return userJson.map((json) => GameOfThrones.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load data");
  }
}

Future<List<GameOfThrones>> fetchGOTByFamily(String familyName) async {
  final allCharacters = await fetchGOT();
  return allCharacters
      .where(
        (character) =>
            character.family?.toLowerCase() == familyName.toLowerCase(),
      )
      .toList();
}
