import 'package:dedikodu/data/models/backend_models/user_model.dart';
import 'package:dedikodu/data/services/backend_services/user_service.dart';
import 'package:flutter/material.dart';

class ProfileController with ChangeNotifier {
  final UserService _userService = UserService();

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  ProfileController() {
    fetchUser();
  }

  Future<void> fetchUser() async {
    _isLoading = true;
    notifyListeners();

    _user = await _userService.getUser();

    _isLoading = false;
    notifyListeners();
  }
}
