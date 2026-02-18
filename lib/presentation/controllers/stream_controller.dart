import 'package:flutter/material.dart';
import '../../data/models/backend_models/post_model.dart';
import '../../data/services/backend_services/post_service.dart';

class StreamController with ChangeNotifier {
  final PostService _postService = PostService();

  List<Post> _posts = [];
  bool _isLoading = false;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;

  StreamController() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    _posts = await _postService.getPosts();

    _isLoading = false;
    notifyListeners();
  }
}
