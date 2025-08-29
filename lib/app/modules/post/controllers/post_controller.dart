import 'package:fluttergetx/app/data/models/post.dart';
import 'package:fluttergetx/app/services/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostService _postService = Get.put<PostService>(PostService());

  // karena yang mau ditampung adalah list Post, bukan PostModel
  RxList<Post> posts = <Post>[].obs;  
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await _postService.fetchPosts();

      if (response.statusCode == 200) {
        // parsing ke PostModel
        final postModel = PostModel.fromJson(response.body);

        // ambil data List<Post> dari dalam postModel
        final data = postModel.data ?? [];

        posts.assignAll(data);
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
