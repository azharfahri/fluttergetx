import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PostService extends GetConnect {
  final box = GetStorage(); 

  @override
  void onInit() {
    httpClient.baseUrl = 'http://127.0.0.1:8000/api';
    super.onInit();
  }

  Future<Response> fetchPosts() async {
    try {
      final token = box.read("token"); // box bisa diakses karena sudah jadi property
      return await get(
        "/posts", // baseUrl + "/posts"
        headers: {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: "Exception: $e");
    } 
  }
}
