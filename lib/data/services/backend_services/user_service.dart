import '../../models/backend_models/user_model.dart';

class UserService {
  Future<User> getUser() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));

    return User(
      name: 'Ayşe Demir',
      location: 'Kadıköy, İstanbul',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCFTVprboA154ywnsxNEmds3rQWzokoMeg0UoHQDEq-sBx0kyQIrGIiMN4GaZeksi1RQRGIl7o_NbpsCExLpMtqXmA0WPoqQrrDL7d1Wzky_oq97-DkqScSZTFU92Een1i6cVRK-Jwid2SZdc4AnB3hNuOaIXQVfcjp3ZSpyWn5s0OdiePh0rXQ0u_p1laVTE0JMLpNRhEqei_4kKlMyPXFomC2IF3-LjOQam_YuPtQutEUEgKKupbjCgY5XHw6WZ3ABIPUgK6o75w',
      isVerified: true,
    );
  }
}
