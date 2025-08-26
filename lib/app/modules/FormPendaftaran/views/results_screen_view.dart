import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: Column(
        children: [
          Text(name),
          Text(gender),
          Text(DateFormat('dd-MM-yyyy').format(dateOfBirth))
        ],
      )
    );
  }
}
