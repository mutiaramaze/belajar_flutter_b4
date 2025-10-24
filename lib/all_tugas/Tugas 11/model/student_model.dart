import 'dart:convert';

class StudentModel {
  int? id;
  String name;
  String email;
  String numberphone;
  int city;
  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.numberphone,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'class': numberphone,
      'city': city,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      numberphone: map['class'] as String,
      city: map['city'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
