import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/posts_bloc.dart';
import '../models/post.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Créer un Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPost = Post(
                  id: DateTime.now().toString(),
                  title: titleController.text,
                  description: descriptionController.text,
                );
                context.read<PostsBloc>().add(AddPost(newPost));
                Navigator.pop(context);
              },
              child: const Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }
}