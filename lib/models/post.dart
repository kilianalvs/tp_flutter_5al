class Post {
  final String id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  factory Post.fromFirestore(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}