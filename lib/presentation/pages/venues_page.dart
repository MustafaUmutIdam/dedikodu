import 'package:dedikodu/data/models/backend_models/venue_model.dart';
import 'package:dedikodu/presentation/controllers/venues_controller.dart';
import 'package:dedikodu/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VenuesPage extends StatefulWidget {
  const VenuesPage({super.key});

  @override
  State<VenuesPage> createState() => _VenuesPageState();
}

class _VenuesPageState extends State<VenuesPage> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.cardLight.withOpacity(0.8),
        elevation: 0,
        leading: const Icon(Icons.storefront, color: AppColors.primary, size: 32),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mahalle Esnafı',
              style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.textGrey, size: 14),
                const SizedBox(width: 4),
                const Text('Kadıköy, İstanbul',
                    style: TextStyle(color: AppColors.textGrey, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle, color: AppColors.textDark),
              label: const Text('Dükkanımı Ekle',
                  style: TextStyle(color: AppColors.textDark)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => VenuesController(),
        child: Consumer<VenuesController>(
          builder: (context, controller, child) {
            if (controller.isLoading && controller.venues.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.only(bottom: 120),
              children: [
                _buildSearchBar(),
                _buildViewToggle(),
                _buildContent(controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(VenuesController controller) {
    if (_isGridView) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: controller.venues.map((venue) {
            final screenWidth = MediaQuery.of(context).size.width;
            final itemWidth = (screenWidth - 48) / 2; // (width - padding*2 - spacing) / 2
            return SizedBox(
              width: itemWidth,
              child: _buildVenueGridCard(venue),
            );
          }).toList(),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: controller.venues.length,
        itemBuilder: (context, index) {
          return _buildVenueListCard(controller.venues[index]);
        },
      );
    }
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Esnaf veya ürün ara...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.primaryWithOpacity(0.05),
        ),
      ),
    );
  }

  Widget _buildViewToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Yakınındaki Esnaflar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.primaryWithOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                _buildToggleButton(true, Icons.grid_view, 'Grid'),
                _buildToggleButton(false, Icons.view_list, 'Liste'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(bool isGrid, IconData icon, String label) {
    final isSelected = _isGridView == isGrid;
    return GestureDetector(
      onTap: () => setState(() => _isGridView = isGrid),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardLight : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: isSelected ? AppColors.textDark : AppColors.textGrey),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.textDark : AppColors.textGrey)),
          ],
        ),
      ),
    );
  }

  Widget _buildVenueGridCard(Venue venue) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: AppColors.cardLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildVenueImage(venue, 150),
          _buildVenueGridInfo(venue),
        ],
      ),
    );
  }

  Widget _buildVenueListCard(Venue venue) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: AppColors.cardLight,
      child: Column(
        children: [
          _buildVenueImage(venue, 180),
          _buildVenueListInfo(venue),
        ],
      ),
    );
  }

  Widget _buildVenueImage(Venue venue, double height, {double? width}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          child: Image.network(
            venue.imageUrl,
            height: height,
            width: width ?? double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.cardLight.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: AppColors.primary, size: 14),
                const SizedBox(width: 2),
                Text(venue.rating.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildVenueGridInfo(Venue venue) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  venue.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWithOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(venue.category.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark))),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            venue.description,
            style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Detaylar',
                    style: TextStyle(color: AppColors.primary)),
              ),
            ],
          )
        ],
      ),
    );
  }

   Widget _buildVenueListInfo(Venue venue) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(venue.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
           Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWithOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(venue.category.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark))),
          const SizedBox(height: 8),
          Text(
            venue.description,
            style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Detaylar',
                  style: TextStyle(color: AppColors.primary)),
            ),
          )
        ],
      ),
    );
  }
}
