import 'package:belajar_flutter_b4/all_tugas/API%20day%2031/views/dashboard.dart';

import 'package:flutter/material.dart';

class HomeOfGOT extends StatelessWidget {
  const HomeOfGOT({super.key});

  final List<String> families = const [
    "House Stark",
    "House Lannister",
    "House Targaryen",
    "House Baratheon",
    "House Greyjoy",
    "House Tyrell",
    "House Tarly",
    "House Clegane",
    "House Baelish",
    "House Seaworth",
    "Free Folk",
    "Tarth",
    "Naathi",
    "Stark",
    "Bolton",
    "Naharis",
    "Worm",
    "Targaryan",
    "Lorath",
    "Lannister",
    "Tyrell",
    "Qyburn",
    "Bronn",
    "Lorathi",
    "Greyjoy",
    "Sand",
    "Baratheon",
    "Viper",
    "Mormont",
    "Sparrow",
    "None",
    "Unknown",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset(AppImages.got),
            const SizedBox(height: 50),
            Divider(),
            SizedBox(height: 40),
            const Text(
              "Game of Thrones Families",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 33,
                mainAxisSpacing: 33,
              ),
              itemCount: families.length,
              itemBuilder: (BuildContext context, int index) {
                final family = families[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(familyName: family),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9EFF8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        family,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF4962BF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
