import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/databse/db_helper.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas%2011/model/student_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:belajar_flutter_b4/all_tugas/widgets/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CRWidgetDay19 extends StatefulWidget {
  const CRWidgetDay19({super.key});

  @override
  State<CRWidgetDay19> createState() => _CRWidgetDay19State();
}

class _CRWidgetDay19State extends State<CRWidgetDay19> {
  final nameC = TextEditingController();
  final passwordC = TextEditingController();
  final emailC = TextEditingController();
  final usernameC = TextEditingController();
  getData() {
    DbHelper.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Text("Pendaftaran Siswa", style: TextStyle(fontSize: 24)),
            buildTextField(hintText: "Name", controller: nameC),
            buildTextField(hintText: "Number Phone", controller: passwordC),
            buildTextField(hintText: "Class", controller: usernameC),
            buildTextField(hintText: "Email", controller: emailC),
            LoginButton(
              text: "Tambahkan",
              onPressed: () {
                if (nameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nama belum diisi");
                } else if (emailC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Email belum diisi");
                } else if (usernameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Class belum diisi");
                } else if (passwordC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nomor Handphone belum diisi");
                } else {
                  final StudentModel dataStudent = StudentModel(
                    name: nameC.text,
                    email: emailC.text,
                    username: usernameC.text,
                    password: int.parse(passwordC.text),
                  );
                  DbHelper.createStudent(dataStudent).then((value) {
                    emailC.clear();
                    passwordC.clear();
                    usernameC.clear();
                    nameC.clear();
                    getData();
                    Fluttertoast.showToast(msg: "Data berhasil ditambahkan");
                  });
                }
              },
            ),
            SizedBox(height: 30),
            FutureBuilder(
              future: DbHelper.getAllStudent(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<StudentModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.name),
                              subtitle: Text(items.email),
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
