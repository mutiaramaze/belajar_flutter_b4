import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 242, 255),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 50),
          Text(
            "Formulir Pengguna",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Text("Nama", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
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

                  Text(
                    "Nomor Handphone",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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

                  Text(
                    "Deskripsi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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

          //no 2
          SizedBox(height: 50),
          Text(
            "Daftar Produk",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 156, 206, 250),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/xylitol.jpg")),
              title: Text(
                "Xylitol",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp9000"),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          SizedBox(height: 10),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 156, 206, 250),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/milna.jpg")),
              title: Text(
                "Milna",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp12000"),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          SizedBox(height: 10),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 156, 206, 250),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/mogu.jpg")),
              title: Text(
                "Mogu Mogu",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp9000"),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          SizedBox(height: 10),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 156, 206, 250),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/Pringles.jpg")),
              title: Text(
                "Pringles",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp12000"),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          SizedBox(height: 10),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 156, 206, 250),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/roti.jpg")),
              title: Text(
                "Roti Gandum",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp24000"),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
