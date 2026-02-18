
import 'package:dedikodu/data/models/backend_models/event_model.dart';
import 'package:dedikodu/presentation/controllers/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF19E65E);
    final Color backgroundColorLight = const Color(0xFFF6F8F6);

    return Scaffold(
        backgroundColor: backgroundColorLight,
        appBar: AppBar(
          backgroundColor: backgroundColorLight.withOpacity(0.8),
          elevation: 0,
          leading: Icon(Icons.location_on, color: primaryColor),
          titleSpacing: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'KADIKÖY, İSTANBUL',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Canlı Etkinlikler',
                style: TextStyle(
                    color: Color(0xFF112116),
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.notifications_none,
                      color: Color(0xFF112116)),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: primaryColor,
                child: IconButton(
                  icon: const Icon(Icons.add, color: Color(0xFF112116)),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: ChangeNotifierProvider(
          create: (context) => EventsController(),
          child: Consumer<EventsController>(
            builder: (context, controller, child) {
              if (controller.isLoading && controller.events.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: [
                  _buildCategoryFilter(controller),
                  _buildSectionTitle(controller.events.length),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.events.length,
                    itemBuilder: (context, index) {
                      final event = controller.events[index];
                      if (controller.selectedCategory == 'Hepsi' ||
                          event.category == controller.selectedCategory) {
                        return _buildEventCard(event);
                      }
                      return Container();
                    },
                  )
                ],
              );
            },
          ),
        ));
  }

  Widget _buildCategoryFilter(EventsController controller) {
    final categories = ['Hepsi', 'Oyunlar', 'Dış Mekan', 'Evcil Hayvan'];
    final icons = [
      Icons.apps,
      Icons.sports_esports,
      Icons.park,
      Icons.pets
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final icon = icons[index];
          final isSelected = controller.selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              shape: const StadiumBorder(),
              avatar: Icon(icon, color: isSelected ? const Color(0xFF112116) : const Color(0xFF63886F)),
              label: Text(category),
              selected: isSelected,
              onSelected: (bool selected) {
                if (selected) {
                  controller.setSelectedCategory(category);
                }
              },
              backgroundColor: Colors.white,
              selectedColor: const Color(0xFF19E65E),
              labelStyle: TextStyle(
                  color: isSelected
                      ? const Color(0xFF112116)
                      : const Color(0xFF63886F),
                  fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(int eventCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Yakındaki Etkinlikler',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF19E65E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('$eventCount Aktif',
                style: const TextStyle(
                    color: Color(0xFF19E65E),
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: Column(
        children: [
          _buildEventImage(event),
          _buildEventInfo(event),
        ],
      ),
    );
  }

  Widget _buildEventImage(Event event) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)),
          child: Image.network(
            event.imageUrl,
            height: 192,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, color: Color(0xFF19E65E), size: 16),
                const SizedBox(width: 4),
                Text(event.time,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEventInfo(Event event) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              _buildParticipantAvatars(event.participantAvatars),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.storefront, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Text(event.locationName,
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Doluluk', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text('${event.currentParticipants}/${event.maxParticipants} Katılımcı',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF19E65E),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12)
                ),
                child: const Text('Katıl',
                    style: TextStyle(color: Color(0xFF112116), fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildParticipantAvatars(List<String> avatars) {
  return Row(
    children: [
      for (int i = 0; i < avatars.length; i++)
        Align(
          widthFactor: 0.7,
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(avatars[i]),
          ),
        ),
       if(avatars.length > 2) Align(
         widthFactor: 0.7,
         child: CircleAvatar(
           radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Text('+${avatars.length - 2}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
         ),
       )
    ],
  );
}
