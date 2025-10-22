import 'package:flutter/material.dart';

class KesehatanModel {
  final String name;
  final int price;
  final String description;
  final String image;
  final Color? backgroundColor;
  KesehatanModel({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    this.backgroundColor,
  });
}
