import 'package:dedikodu/presentation/controllers/profile_controller.dart';
import 'package:dedikodu/presentation/theme/app_colors.dart';
import 'package:dedikodu/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: const Icon(Icons.person, color: AppColors.primary, size: 32),
        backgroundColor: AppColors.cardLight.withOpacity(0.8),
        elevation: 0,
        title: Text('Profilim', style: AppTextStyles.title.copyWith(color: AppColors.textDark)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.textDark),
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
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.verified, color: AppColors.textLight, size: 20),
                  ),
                )
            ],
          ),
          const SizedBox(height: 16),
          Text(user.name, style: AppTextStyles.headline),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(user.location, style: AppTextStyles.caption.copyWith(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: AppColors.textDark),
            label: Text('Profili Düzenle', style: AppTextStyles.button.copyWith(color: AppColors.textDark)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
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
            colors: [AppColors.premiumGradientStart, AppColors.premiumGradientEnd],
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
                Text('Mahalle Premium', style: AppTextStyles.title.copyWith(color: AppColors.textLight)),
                Icon(Icons.workspace_premium, color: AppColors.gold),
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
                backgroundColor: AppColors.textLight,
                minimumSize: const Size(double.infinity, 50),
                shape: const StadiumBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Hemen Katıl', style: AppTextStyles.button.copyWith(color: AppColors.textDark)), const Icon(Icons.arrow_forward, color: AppColors.textDark)],
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
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.body.copyWith(color: AppColors.textLight)),
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
          Text('Hesap Ayarları', style: AppTextStyles.caption.copyWith(color: Colors.grey, fontWeight: FontWeight.bold)),
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
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: AppTextStyles.bodyBold),
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
        icon: const Icon(Icons.logout, color: AppColors.red),
        label: Text('Çıkış Yap', style: AppTextStyles.button.copyWith(color: AppColors.red)),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.red),
          minimumSize: const Size(double.infinity, 50),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
