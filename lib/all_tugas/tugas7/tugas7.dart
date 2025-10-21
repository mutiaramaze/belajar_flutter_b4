import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Checked extends StatefulWidget {
  const Checked({super.key});

  @override
  State<Checked> createState() => _CheckedState();
}

class _CheckedState extends State<Checked> {
  @override
  bool isChecked = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //1
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("Saya menyetujui semua persyaratan yang berlaku"),
              ],
            ),
          ),

          Text(
            isChecked
                ? "Lanjutkan pendaftaran diperbolehkan"
                : "Anda belum bisa melanjutkan",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// no 2
class Switched extends StatefulWidget {
  const Switched({super.key});

  @override
  State<Switched> createState() => _SwitchedState();
}

class _SwitchedState extends State<Switched> {
  @override
  bool isSwitch = false;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Switch(
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;
              });
            },
          ),
        ),
        Text(isSwitch ? "Mode gelap aktif" : "Mode terang aktif"),
        Container(
          height: 500,
          width: double.infinity,
          color: isSwitch
              ? Colors.black
              : const Color.fromARGB(255, 208, 228, 245),
        ),
      ],
    );
  }
}

// no 3
class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? dropDownValue;
  final List<String> listProduct = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton(
            value: dropDownValue,
            items: listProduct.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val, style: TextStyle(color: Colors.black)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropDownValue = value;
              });
              print(dropDownValue);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                "Anda memilih kategori: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(dropDownValue.toString()),
            ],
          ),
        ),
      ],
    );
  }
}

// no 4
class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tanggal lahir: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              Text(DateFormat('yyyy, dd MMMM').format(selectedPicked!)),
            ],
          ),
        ),

        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime(2025),
            );
            if (picked != null) ;
            print(picked);
            setState(() {
              selectedPicked = picked;
            });
          },
          child: Text("Pilih tanggal lahir"),
        ),
      ],
    );
  }
}

//no 5
class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? SelectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                print(picked);
                setState(() {
                  SelectedTime = picked;
                });
              }
            },
            child: Text("Pilih waktu pengingat"),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pengingat diatur pukul: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              SelectedTime != null
                  ? SelectedTime!.format(context)
                  : "Belum dipilih",
            ),
          ],
        ),
      ],
    );
  }
}
