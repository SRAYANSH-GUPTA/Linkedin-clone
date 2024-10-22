import 'package:flutter/foundation.dart';
import '../models/post.dart';

class PostViewModel extends ChangeNotifier {
  final List<Post> _posts = [
    Post(username: "John Doe", imageUrl: "https://example.com/image1.jpg", timestamp: "2 hours ago"),
    Post(username: "Jane Smith", imageUrl: "https://example.com/image2.jpg", timestamp: "3 hours ago"),
    Post(username: "Mike Johnson", imageUrl: "https://example.com/image3.jpg", timestamp: "5 hours ago"),
  ];

  List<Post> get posts => List.unmodifiable(_posts);
}
