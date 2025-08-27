import 'package:fluttergetx/app/data/models/quran.dart';
import 'package:fluttergetx/app/services/quran_service.dart';
import 'package:get/get.dart';

class QuranController extends GetxController {
  final QuranService _quranService = Get.put<QuranService>(QuranService());

  RxList quran = <Quran>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuran();
  }

  void fetchQuran() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _quranService.fetchQuran();
      if (response.statusCode == 200) {
        var data = response.body!
            .map((quranJson) => Quran.fromJson(quranJson))
            .toList();
        quran.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
