import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/loginT11.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/student_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/user_model.dart';
import 'package:flutter/material.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  getData() {
    DbHelper.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Column(
        children: [
          SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "List data user:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),

          FutureBuilder(
            future: DbHelper.getAllStudent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.data == null) {
                return CircularProgressIndicator();
              } else {
                final data = snapshot.data as List<UserModel>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final items = data[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(items.name ?? ""),
                            subtitle: Text(items.email ?? ""),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
