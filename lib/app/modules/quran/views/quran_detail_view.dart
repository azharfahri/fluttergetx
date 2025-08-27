import 'package:flutter/material.dart';
import 'package:fluttergetx/app/data/models/quran.dart';
import 'package:get/get.dart';

class QuranDetailView extends StatelessWidget {
  final Quran quran;

  const QuranDetailView({super.key, required this.quran});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quran.nama ?? 'Detail Surah'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Nama Arab
            Text(
              quran.asma ?? '',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'ScheherazadeNew', // font arabic
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Nama Latin & Arti
            Text(
              "${quran.nama} • ${quran.arti}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Info tambahan
            Text(
              "${quran.type == Type.MEKAH ? 'Makkiyah' : 'Madaniyah'} • ${quran.ayat} Ayat",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 32),
            // Keterangan panjang
            Text(
              quran.keterangan ?? '',
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
