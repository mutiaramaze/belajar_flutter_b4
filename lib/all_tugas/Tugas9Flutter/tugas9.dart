import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/constant/app_color.dart';
import 'package:belajar_flutter_b4/all_tugas/tugas7/models.dart';
import 'package:belajar_flutter_b4/all_tugas/Tugas9Flutter/constant/app_image.dart';
import 'package:belajar_flutter_b4/extension/rupiah.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

// listview list
class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  final List<String> produkKesehatan = [
    "Komix herbal",
    "Blackmores",
    "Antiseptik",
    "Plester",
    "Pulse Oximeter",
    "Betadine",
    "Termometer",
    "Nebulizer",
    "Tensimeter",
    "Glukometer",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produkKesehatan.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(produkKesehatan[index]));
      },
    );
  }
}

//list view map
class TugasKe9 extends StatefulWidget {
  const TugasKe9({super.key});

  @override
  State<TugasKe9> createState() => _TugasKe9State();
}

class _TugasKe9State extends State<TugasKe9> {
  final List<Map<String, dynamic>> produkKesehatan = [
    {
      'name': 'Komix herbal',
      'price': '5000',
      'icon': Icons.safety_check_outlined,
    },
    {
      'name': 'Blackmores',
      'price': '5000',
      'icon': Icons.panorama_vertical_select,
    },
    {'name': 'Antiseptik', 'price': '5000', 'icon': Icons.biotech_outlined},
    {
      'name': 'Plester',
      'price': '5000',
      'icon': Icons.panorama_photosphere_rounded,
    },
    {
      'name': 'Pulse Oximeter',
      'price': '5000',
      'icon': Icons.rounded_corner_outlined,
    },
    {
      'name': 'Betadine',
      'price': '5000',
      'icon': Icons.share_arrival_time_sharp,
    },
    {'name': 'Termometer', 'price': '5000', 'icon': Icons.line_axis},
    {'name': 'Nebulizer', 'price': '5000', 'icon': Icons.safety_check_outlined},
    {
      'name': 'Tensimeter',
      'price': '5000',
      'icon': Icons.safety_check_outlined,
    },
    {
      'name': 'Glukometer',
      'price': '5000',
      'icon': Icons.safety_check_outlined,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produkKesehatan.length,
      itemBuilder: (BuildContext context, int index) {
        final item = produkKesehatan[index];
        return ListTile(
          onTap: () {
            DelightToastBar(
              autoDismiss: true,
              snackbarDuration: Duration(milliseconds: 2000),
              builder: (context) => ToastCard(
                leading: Icon(Icons.flutter_dash, size: 28),
                title: Text(
                  "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ).show(context);
          },
          leading: Icon(item["icon"]),
          title: Text(item["name"]),
        );
      },
    );
  }
}

//list view model
class Tugass9 extends StatefulWidget {
  const Tugass9({super.key});

  @override
  State<Tugass9> createState() => _Tugass9State();
}

class _Tugass9State extends State<Tugass9> {
  final List<KesehatanModel> produkKesehatan = [
    KesehatanModel(
      name: "Antiseptik",
      price: 25000,
      description: "Segar",
      backgroundColor: AppColor.a,
      image: AppImage.antiseptik,
    ),
    KesehatanModel(
      name: "Betadine",
      price: 5000,
      description: "Segar",
      backgroundColor: AppColor.b,
      image: AppImage.betadine,
    ),
    KesehatanModel(
      name: "Blackmores",
      price: 15000,
      description: "Segar",
      backgroundColor: AppColor.a,
      image: AppImage.blackmores,
    ),
    KesehatanModel(
      name: "Glukometer",
      price: 35000,
      description: "Segar",
      backgroundColor: AppColor.b,
      image: AppImage.glukometer,
    ),
    KesehatanModel(
      name: "Komix Herbal",
      price: 12000,
      description: "Segar",
      backgroundColor: AppColor.a,
      image: AppImage.komixherbal,
    ),
    KesehatanModel(
      name: "Nebulizer",
      price: 5000,
      description: "Segar",
      backgroundColor: AppColor.b,
      image: AppImage.nebulizer,
    ),
    KesehatanModel(
      name: "Plester",
      price: 5000,
      description: "Segar",
      backgroundColor: AppColor.a,
      image: AppImage.plester,
    ),
    KesehatanModel(
      name: "Pulse Oximeter",
      price: 15000,
      description: "Segar",
      backgroundColor: AppColor.b,
      image: AppImage.pulseOximeter,
    ),
    KesehatanModel(
      name: "Tensimeter",
      price: 35000,
      description: "Segar",
      backgroundColor: AppColor.a,
      image: AppImage.tensimeter,
    ),
    KesehatanModel(
      name: "Termometer",
      price: 2000,
      description: "Segar",
      backgroundColor: AppColor.b,
      image: AppImage.termometer,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produkKesehatan.length,
      itemBuilder: (BuildContext context, int index) {
        final item = produkKesehatan[index];
        return ListTile(
          onTap: () {},
          tileColor: item.backgroundColor,
          leading: Image.asset(item.image, width: 60),
          title: Text(item.name),
          subtitle: Text(item.price.toString().toRPCurrency()),
        );
      },
    );
  }
}
