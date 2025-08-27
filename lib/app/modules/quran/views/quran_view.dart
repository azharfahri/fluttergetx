import 'package:flutter/material.dart';
import 'package:fluttergetx/app/data/models/quran.dart';
import 'package:fluttergetx/app/modules/quran/views/quran_detail_view.dart';
import 'package:get/get.dart';
import '../controllers/quran_controller.dart';


class QuranView extends GetView<QuranController> {
  const QuranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Qur\'an'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (controller.quran.isEmpty) {
          return const Center(child: Text("Data surah tidak tersedia"));
        }

        return ListView.builder(
          itemCount: controller.quran.length,
          itemBuilder: (context, index) {
            final Quran surah = controller.quran[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Text(
                    surah.nomor ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  surah.nama ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${surah.arti ?? ''} • ${surah.type == Type.MEKAH ? 'Makkiyah' : 'Madaniyah'}",
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: Text(
                  surah.asma ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ScheherazadeNew', // kalau ada font Arabic
                  ),
                ),
                onTap: () => Get.to(() => QuranDetailView(quran: surah)),
              ),
            );
          },
        );
      }),
    );
  }
}
