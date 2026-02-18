import 'package:dedikodu/data/models/backend_models/venue_model.dart';
import 'package:dedikodu/data/services/backend_services/venue_service.dart';
import 'package:flutter/material.dart';

class VenuesController with ChangeNotifier {
  final VenueService _venueService = VenueService();

  List<Venue> _venues = [];
  bool _isLoading = false;

  List<Venue> get venues => _venues;
  bool get isLoading => _isLoading;

  VenuesController() {
    fetchVenues();
  }

  Future<void> fetchVenues() async {
    _isLoading = true;
    notifyListeners();

    _venues = await _venueService.getVenues();

    _isLoading = false;
    notifyListeners();
  }
}
