import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post.dart';
import '../repositories/posts_repository.dart';

abstract class PostsEvent {}

class LoadPosts extends PostsEvent {}

class AddPost extends PostsEvent {
  final Post post;
  AddPost(this.post);
}

class UpdatePost extends PostsEvent {
  final Post post;
  UpdatePost(this.post);
}

abstract class PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded(this.posts);
}

class PostsError extends PostsState {}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _repository = PostsRepository();

  PostsBloc() : super(PostsLoading()) {
    on<LoadPosts>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await _repository.fetchPosts();
        emit(PostsLoaded(posts));
      } catch (_) {
        emit(PostsError());
      }
    });

    on<AddPost>((event, emit) async {
      try {
        await _repository.addPost(event.post);
        add(LoadPosts());
      } catch (_) {
        emit(PostsError());
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        await _repository.updatePost(event.post);
        add(LoadPosts());
      } catch (_) {
        emit(PostsError());
      }
    });
  }
}