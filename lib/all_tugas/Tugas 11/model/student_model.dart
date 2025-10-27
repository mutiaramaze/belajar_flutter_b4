import 'dart:convert';

class StudentModel {
  int? id;
  String name;
  String email;
  String username;
  int password;
  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'class': username,
      'password': password,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      username: map['class'] as String,
      password: map['password'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
