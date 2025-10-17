import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

bool showText = true;
bool showIcon = true;
bool showButton = true;
bool floating = true;
bool box = true;
int angka = 0;
int counter = 0;

class _Tugas5State extends State<Tugas5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 5 Flutter"),
        backgroundColor: Colors.brown.shade200,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Kurang $counter");
          counter--;
          setState(() {});
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            // Tugas 1
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    if (showText)
                      Text(
                        "Rizni Mutiara Farannita",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[50],
                      ),
                      onPressed: () {
                        print("Tekan sekali : $showText");
                        showText = !showText;
                        setState(() {});
                      },
                      child: Text(
                        "Tampilkan nama",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // tugas2
          if (showIcon) Text("Disukai"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    print("Tekan sekali : $showIcon");
                    showIcon = !showIcon;
                    setState(() {});
                  },
                  icon: Icon(showIcon ? Icons.favorite : Icons.favorite_border),
                ),
              ),
            ),
          ),

          if (showButton) Text("Ini deskripsi"),
          //tugas3
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () {
                      print("Tekan sekali : $showButton");
                      showButton = !showButton;
                      setState(() {});
                    },
                    child: Text("Selengkapnya"),
                  ),
                ),
              ),
            ),
          ),

          //tugas4
          Text("Hitung mundur: "),
          Text(counter.toString()),

          // tugas5
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                splashColor: Colors.orange,
                onTap: () {
                  print("Kotak disentuh");

                  box = !box;
                  setState(() {});
                },
                child: Center(child: Text(box ? "ada" : "")),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onLongPress: () {
                  angka += 3;
                  setState(() {});
                  print("ditambah 3 = $angka");
                },
                onTap: () {
                  angka++;
                  setState(() {});
                  print("ditambah 1 = $angka");
                },
                onDoubleTap: () {
                  angka += 2;
                  setState(() {});
                  print("ditambah 2 = $angka");
                },
                child: Text("Tekan aku"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
