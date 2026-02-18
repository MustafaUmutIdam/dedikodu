import 'package:dedikodu/data/models/backend_models/comment_model.dart';
import 'package:dedikodu/data/models/backend_models/post_model.dart';
import 'package:dedikodu/data/services/backend_services/post_service.dart';
import 'package:flutter/material.dart';

class PostDetailController with ChangeNotifier {
  final PostService _postService = PostService();

  Post? _post;
  List<Comment> _comments = [];
  bool _isLoading = true;

  Post? get post => _post;
  List<Comment> get comments => _comments;
  bool get isLoading => _isLoading;

  Future<void> fetchPostDetails(String postId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _post = await _postService.getPostDetails(postId);
      _comments = await _postService.getComments(postId);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
