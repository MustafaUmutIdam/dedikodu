import '../../models/backend_models/venue_model.dart';

class VenueService {
  Future<List<Venue>> getVenues() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));

    return [
      Venue(
        id: '1',
        name: 'Güneş Fırını',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBZEA6QrcDNFJCbz21o1Vz8dEXZmqr9sa-st-uoZHjsbEtyWo0-uRjfbtmXaBNrMEtCZtxIeBsPyJfgoEms8kRf1FBlUKVv8GIJn8DhXMLhA0HC-z9vkhRgNLBrfzmKecbS0ZwjkAtEGV_sU_qUW7DsTct7Gtwd5Ep8xnrJd-JGTGqwk2HhxYiiaWl3D4sXFzhy0wXLXPrV4Xjs46NaC-g05kbhne25sNXBFGWmUWlNV_-4-MscoY17mnA11yCAUDYKZIVlKiOLFU0',
        rating: 4.8,
        category: 'Fırın',
        description: 'Geleneksel ekşi mayalı ekmekler ve günlük taze poğaçalar.',
      ),
      Venue(
        id: '2',
        name: 'Yıldız Manav',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuD1Lh2i43KRAdJJTTsjCcDhfgZyv0cB9KbCaUa7I817YnNYUxJclzRVvRFcaXVmPv_U2Sum7EdGWAHIP7FTsvYqD4Hm3gHUO28XEnCCtIZYI8VlbvuiMGmW2D5XPR2r9VvLPk3HNJbhBqbjo1aZBU0IVc0YBVVjKUKa_UWzZFAe8xg3-Tn_EqJvb8fAXWSa74PHXeqfLO9t2CoxEJIY1rXf_XudP9atxn6pSfknBeVP5nOenDiNDkDpKMIKusW7eJI2FA41HRno7l0',
        rating: 4.6,
        category: 'Manav',
        description: 'Doğrudan çiftlikten gelen taze organik meyve ve sebzeler.',
      ),
    ];
  }
}
