import 'package:flutter/foundation.dart';
import '../models/post.dart';

class PostViewModel extends ChangeNotifier {
  final List<Post> _posts = [
    Post(username: "Srayansh", imageUrl: "assets/1.jpg", timestamp: "2 hours ago",content: "Exciting Milestone Achieved!!"),
    Post(username: "Jane Smith", imageUrl: "assets/2.jpg", timestamp: "3 hours ago", content: "On October 7th 15 high school students.."),
    Post(username: "Mike Johnson", imageUrl: "assets/3.jpg", timestamp: "5 hours ago", content: "Excited to share my experience from HackHarvard"),
  ];

  List<Post> get posts => List.unmodifiable(_posts);
}
