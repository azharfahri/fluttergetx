import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Beranda',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Tombol menu dalam bentuk Card ListTile
            _buildMenuItem(
              icon: Icons.calculate,
              title: "Counter",
              subtitle: "Menu untuk menghitung angka",
              onTap: () => Get.toNamed('/counter'),
            ),
            _buildMenuItem(
              icon: Icons.app_registration,
              title: "Form Pendaftaran",
              subtitle: "Isi data pendaftaran",
              onTap: () => Get.toNamed('/form-pendaftaran'),
            ),
            _buildMenuItem(
              icon: Icons.article,
              title: "Post",
              subtitle: "Lihat data postingan",
              onTap: () => Get.toNamed('/post'),
            ),
            _buildMenuItem(
              icon: Icons.menu_book,
              title: "Al-Qur'an",
              subtitle: "Baca ayat-ayat Al-Qur'an",
              onTap: () => Get.toNamed('/quran'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Icon(icon, size: 32, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
