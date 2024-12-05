import 'package:tp_flutter_5al/models/post.dart';
import 'dart:async';

class FakePostsDataSource {
  final List<Post> _fakePosts = [
    Post(id: '1', title: 'Mon post voiture', description: 'Description of Post 1'),
    Post(id: '2', title: 'Mon post finance', description: 'Description of Post 2'),
    Post(id: '3', title: 'Mon post sport', description: 'Description of Post 3'),
  ];

  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  Future<Post> createPost(Post postToAdd) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts.add(postToAdd);
    return postToAdd;
  }

  Future<Post> updatePost(Post newPost) async {
    await Future.delayed(const Duration(seconds: 1));
    int index = _fakePosts.indexWhere((post) => post.id == newPost.id);
    if (index != -1) {
      _fakePosts[index] = newPost;
    }
    return newPost;
  }
}