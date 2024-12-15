import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/posts_bloc.dart';
import '../models/post.dart';

class DetailScreen extends StatefulWidget {
  final Post post;
  const DetailScreen({super.key, required this.post});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.post.title);
    _descriptionController = TextEditingController(text: widget.post.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails du Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedPost = Post(
                  id: widget.post.id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                context.read<PostsBloc>().add(UpdatePost(updatedPost));
                Navigator.pop(context);
              },
              child: const Text('Mettre à jour'),
            ),
          ],
        ),
      ),
    );
  }
}