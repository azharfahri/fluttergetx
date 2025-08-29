import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttergetx/app/modules/post/views/post_detail_view.dart';

import '../controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  PostView({Key? key}) : super(key: key);
  PostController controller = Get.put(PostController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final posts = controller.posts;
        if (posts.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: posts.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final post = posts[i];
            return ListTile(
              leading: post.foto != null
                  ? Image.network(
                      // kalau foto dari API ada, tampilkan
                      "http://127.0.0.1:8000/storage/${post.foto}",
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      // fallback pakai dummy image
                      "https://picsum.photos/id/${post.id ?? 1}/64/64",
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
              title: Text(post.title ?? "Tanpa Judul"),
              subtitle: Text(
                post.content ?? "-",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Get.to(() => PostDetailView(post: post)),
            );
          },
        );
      }),
    );
  }
}
