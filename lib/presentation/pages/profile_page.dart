import 'package:dedikodu/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF19E65E);
    final Color backgroundColorLight = const Color(0xFFF6F8F6);

    return Scaffold(
      backgroundColor: backgroundColorLight,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text('Profilim', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, controller, child) {
            if (controller.isLoading || controller.user == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.only(bottom: 120),
              children: [
                _buildProfileHeader(controller.user!),
                _buildPremiumBanner(),
                _buildAccountSettings(),
                _buildLogoutButton(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(user) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 56,
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
              if (user.isVerified)
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFF19E65E),
                    child: Icon(Icons.verified, color: Colors.white, size: 20),
                  ),
                )
            ],
          ),
          const SizedBox(height: 16),
          Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(user.location, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Color(0xFF112116)),
            label: const Text('Profili Düzenle', style: TextStyle(color: Color(0xFF112116))),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF19E65E),
              minimumSize: const Size(double.infinity, 50),
              shape: const StadiumBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF112116), Color(0xFF1A3A24)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mahalle Premium', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Icon(Icons.workspace_premium, color: Colors.yellow[700]),
              ],
            ),
            const SizedBox(height: 16),
            _buildPremiumFeature(Icons.local_activity, 'Özel yerel fırsatlar ve indirimler'),
            _buildPremiumFeature(Icons.event_available, 'Öncelikli etkinlik yönetimi'),
            _buildPremiumFeature(Icons.visibility_off, 'Reklamsız ve akıcı deneyim'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: const StadiumBorder(),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Hemen Katıl', style: TextStyle(color: Color(0xFF112116), fontWeight: FontWeight.bold)), Icon(Icons.arrow_forward, color: Color(0xFF112116))],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF19E65E)),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildAccountSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hesap Ayarları', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildSettingsItem(Icons.help_center, 'Yardım ve Destek'),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF19E65E)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, color: Colors.red),
        label: const Text('Çıkış Yap', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red),
          minimumSize: const Size(double.infinity, 50),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
