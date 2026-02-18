
import 'package:dedikodu/data/models/backend_models/post_model.dart';
import 'package:dedikodu/presentation/controllers/stream_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF19E65E);
    final Color backgroundColorLight = const Color(0xFFF6F8F6);
    final Color textColorDark = const Color(0xFF112116);

    return Scaffold(
      backgroundColor: backgroundColorLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: primaryColor),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beşiktaş, Akatlar',
              style: TextStyle(
                  color: textColorDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Yakınındaki 424 komşu aktif',
              style: TextStyle(color: Color(0xFF63886F), fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: textColorDark),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDC10MwlC36ugPIFMQTUY3PQbyo3wlLRaw8O39JCyeiDf-rprViQvyQJBNyvILD9P0hOOtXdPcccGhIs9kih9XMyD_7-j0WIqy6eyzoCGrTACmi0VxzsXjp1fGhoUzTKiUfYaPwUPy2TV7X05fuZ4DyIvW_WKgEAuhogw4cLl9Y8M5qC4dAX-E1eM9bZ4fYZaV4ZIho-uwPfjw6y_73215sIhlDihaW7tVnkhRfI8Y7d9l7hhzTW5XYlJ5CGLClo31rRraJIkpRI9g'),
            ),
          ),
        ],
      ),
      body: Consumer<StreamController>(
        builder: (context, controller, child) {
          if (controller.isLoading && controller.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              _buildQuickPostCreator(),
              _buildFilterTabs(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  final post = controller.posts[index];
                  return _buildPostCard(post);
                },
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildQuickPostCreator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAzkTIAN3P1LrcjypT83p2DomYGbHk6SwiAoDwf7-e0CDFomoz2-94-mG8QA2wuHm5HlD9jl6xA3p0vZHn50AgKvgjiA4ufcD3JAny23DdKZeHzFcEzObL4QCuqD8DM1sOW4TTWlOQiVuZabD6wMD4bKVng6FF6wANf4VijMz84JyRuG5mXiQOv5_NEUP2tC0wapT0gqPg9G1sj-mHMq6yhMimD-FT53Cc4c4eWHUE4xMTNPb9QZzKfb4ZpagSRZ40yq9RjWHFwHdk'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Komşularınla ne paylaşmak istersin?'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.image, color: Color(0xFF63886F)),
                            const SizedBox(width: 8),
                            Icon(Icons.add_location, color: Color(0xFF63886F)),
                            const SizedBox(width: 8),
                            Icon(Icons.mood, color: Color(0xFF63886F)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF19E65E),
                            shape: const StadiumBorder(),
                          ),
                          child: Text('Paylaş',
                              style: TextStyle(color: const Color(0xFF112116))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip('Tümü', true),
          _buildFilterChip('Yardımlaşma', false),
          _buildFilterChip('Etkinlikler', false),
          _buildFilterChip('İkinci El', false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        shape: const StadiumBorder(),
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {},
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFF19E65E),
        labelStyle: TextStyle(
            color:
                isSelected ? const Color(0xFF112116) : const Color(0xFF63886F),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(backgroundImage: NetworkImage(post.userAvatar)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.userName,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('${post.timeAgo} • ${post.category}',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(post.content),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (post.imageUrl != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(post.imageUrl!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover),
              ),
            ),
          if (post.isEvent) _buildEventBanner(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(post.likeCount.toString()),
                    const SizedBox(width: 16),
                    Icon(Icons.chat_bubble_outline, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(post.commentCount.toString()),
                  ],
                ),
                Icon(Icons.share, color: Colors.grey),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEventBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: const Color(0xFF19E65E).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color(0xFF19E65E).withOpacity(0.2))),
      child: Column(
        children: [
          Text("Mahalle Maçı",
              style: TextStyle(
                  color: const Color(0xFF19E65E),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Cumartesi • 10:00 • Akatlar Spor Parkı",
              style: TextStyle(color: const Color(0xFF63886F), fontSize: 12)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF19E65E),
              shape: const StadiumBorder(),
            ),
            child: Text('Katılıyorum',
                style: TextStyle(color: const Color(0xFF112116))),
          ),
        ],
      ),
    );
  }
}
