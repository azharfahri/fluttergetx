import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultsScreenView extends GetView {
  const ResultsScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
  });

  final String name;
  final String gender;
  final DateTime dateOfBirth;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Pendaftaran'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data Pendaftaran",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Nama"),
                  subtitle: Text(name),
                ),
                ListTile(
                  leading: const Icon(Icons.wc),
                  title: const Text("Jenis Kelamin"),
                  subtitle: Text(gender),
                ),
                ListTile(
                  leading: const Icon(Icons.cake),
                  title: const Text("Tanggal Lahir"),
                  subtitle: Text(DateFormat('dd-MM-yyyy').format(dateOfBirth)),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text("No. HP"),
                  subtitle: Text(phone),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
