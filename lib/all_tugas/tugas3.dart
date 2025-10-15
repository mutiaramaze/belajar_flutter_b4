import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //no 1
      backgroundColor: const Color.fromARGB(255, 224, 242, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Formulir Pendaftaran",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 185, 217, 248),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Masukan Nama Anda",
                      ),
                    ),

                    SizedBox(height: 15),
                    Text("Email"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Masukkan Email Anda",
                      ),
                    ),

                    SizedBox(height: 15),

                    Text("Nomor Handphone"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Masukan Nomor Handphone Anda",
                      ),
                    ),

                    SizedBox(height: 15),

                    Text("Deskripsi"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Masukan Deskripsi Anda",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // no 2
            SizedBox(height: 50),
            Text(
              "Galeri Grid",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GridView.builder(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 151, 183, 219),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [Text("Label")],
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
