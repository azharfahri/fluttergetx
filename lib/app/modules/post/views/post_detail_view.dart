import 'package:flutter/material.dart';
import 'package:fluttergetx/app/data/models/post.dart';

class PostDetailView extends StatelessWidget {
  final Post post;

  const PostDetailView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Post #${post.id ?? '-'}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: post.foto != null
                    ? Image.network(
                        "http://127.0.0.1:8000/storage/${post.foto}",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "https://picsum.photos/id/${post.id ?? 1}/400/250",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              post.title ?? "Tanpa Judul",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text(
              post.content ?? "-",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "Dibuat: ${post.createdAt?.toLocal().toString().split(' ').first ?? '-'}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.update, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "Update: ${post.updatedAt?.toLocal().toString().split(' ').first ?? '-'}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
