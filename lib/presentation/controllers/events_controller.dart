import 'package:dedikodu/data/models/backend_models/event_model.dart';
import 'package:dedikodu/data/services/backend_services/event_service.dart';
import 'package:flutter/material.dart';

class EventsController with ChangeNotifier {
  final EventService _eventService = EventService();

  List<Event> _events = [];
  bool _isLoading = false;
  String _selectedCategory = 'Hepsi';

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;

  EventsController() {
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    _isLoading = true;
    notifyListeners();

    _events = await _eventService.getEvents();

    _isLoading = false;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
