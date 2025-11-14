import 'package:flutter/material.dart';
import 'package:belajar_flutter_b4/all_tugas/API%20day%2031/models/user_models.dart';
import 'package:belajar_flutter_b4/all_tugas/API%20day%2031/service/api.dart';

class Dashboard extends StatefulWidget {
  final String familyName;

  const Dashboard({super.key, required this.familyName});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<GameOfThrones>> futureGOT;

  @override
  void initState() {
    super.initState();
    futureGOT = fetchGOTByFamily(widget.familyName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.familyName} Family"),
        backgroundColor: const Color(0xFF4962BF),
      ),
      body: FutureBuilder<List<GameOfThrones>>(
        future: futureGOT,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final data = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final got = data[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(got.imageUrl!),
                    ),
                    title: Text(
                      got.fullName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(got.title!),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("No characters found in ${widget.familyName} Family"),
            );
          }
        },
      ),
    );
  }
}
