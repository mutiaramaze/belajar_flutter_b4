import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 229, 250),
      appBar: AppBar(
        title: Text("Profil Lengkap"),
        backgroundColor: const Color.fromARGB(255, 118, 169, 236),
      ),

      body: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "Rizni Mutiara Farannita",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.mail_outline,
                size: 15,
                color: const Color.fromARGB(255, 2, 0, 0),
              ),

              Text("riznimutiara.f@gmail.com", style: TextStyle(fontSize: 15)),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.smartphone,
                size: 15,
                color: const Color.fromARGB(255, 15, 1, 0),
              ),

              Text("081210982177", style: TextStyle(fontSize: 15)),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //baris 4
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("5"), Text("Postingan")],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("751"), Text("Followers")],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text("Deskripsi Profil : "),
                Text(
                  "Learning coding was totally not on my 2025 bingo list, this is super new for me, seriously. I actually prefer chemistry, but I guees when you talk about the future, Technology is a pretty big deal. I've been trying so hard to study dart and flutter. I just hope I haven't gone insane.",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 162, 131),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade200,
                        Colors.pink.shade50,
                        Colors.blue.shade100,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
