import '../data_sources/fake_posts_data_source.dart';
import '../models/post.dart';

class PostsRepository {
  final FakePostsDataSource _dataSource = FakePostsDataSource();

  Future<List<Post>> fetchPosts() {
    return _dataSource.getAllPosts();
  }

  Future<Post> addPost(Post post) {
    return _dataSource.createPost(post);
  }

  Future<Post> updatePost(Post post) {
    return _dataSource.updatePost(post);
  }
}