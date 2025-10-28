import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/student_model.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:belajar_flutter_b4/all_tugas/widgets/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListData11 extends StatefulWidget {
  const ListData11({super.key});

  @override
  State<ListData11> createState() => _ListData11State();
}

class _ListData11State extends State<ListData11> {
  final nameC = TextEditingController();
  final passwordC = TextEditingController();
  final emailC = TextEditingController();
  final usernameC = TextEditingController();
  getData() {
    DbHelper.getAllUser();
    setState(() {});
  }

  Future<void> _onEdit(UserModel student) async {
    final editNameC = TextEditingController(text: student.name);
    final editEmaileC = TextEditingController(text: student.email);
    final editUsernameC = TextEditingController(text: student.username);
    final editPasswordC = TextEditingController(
      text: student.password.toString(),
    );
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              buildTextField(hintText: "Name", controller: editNameC),
              buildTextField(hintText: "Username", controller: editUsernameC),
              buildTextField(hintText: "Email", controller: editEmaileC),
              buildTextField(hintText: "Password", controller: editPasswordC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = UserModel(
        id: student.id,
        name: editNameC.text,
        email: editEmaileC.text,
        username: editUsernameC.text,
        password: (editPasswordC.text),
      );
      DbHelper.updateModel(updated);
      getData();
      Fluttertoast.showToast(msg: "Data berhasil di update");
    }
  }

  Future<void> _onDelete(UserModel student) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text(
                "Apakah anda ingin menghapus data anda? ${student.name}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DbHelper.deleteModel(student.id!);
      getData();
      Fluttertoast.showToast(msg: 'Data telah di hapus');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "List data user:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            SizedBox(height: 30),
            FutureBuilder(
              future: DbHelper.getAllUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.data == null || snapshot.data.isEmpty) {
                  return Column(children: [
                      
                    ],
                  );
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
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _onEdit(items);
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _onDelete(items);
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
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
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
