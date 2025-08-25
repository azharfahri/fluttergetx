

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  RxInt hitung = 0.obs;

  void increment() {
    if (hitung < 50) {
      hitung++;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh lebih dari 50",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh kosong",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}
