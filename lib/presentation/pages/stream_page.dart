import 'package:dedikodu/data/models/backend_models/post_model.dart';
import 'package:dedikodu/presentation/controllers/stream_controller.dart';
import 'package:dedikodu/presentation/pages/post_detail_page.dart';
import 'package:dedikodu/presentation/theme/app_colors.dart';
import 'package:dedikodu/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.cardLight,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: AppColors.primary),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beşiktaş, Akatlar',
              style: AppTextStyles.title.copyWith(color: AppColors.textDark),
            ),
            Text(
              'Yakınındaki 424 komşu aktif',
              style: AppTextStyles.caption.copyWith(color: AppColors.textGrey),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textDark),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
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
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 120),
            itemCount: controller.posts.length + 2, // For header and filter tabs
            itemBuilder: (context, index) {
              if (index == 0) return _buildQuickPostCreator();
              if (index == 1) return _buildFilterTabs();
              final post = controller.posts[index - 2];
              return _buildPostCard(context, post);
            },
          );
        },
      ),
    );
  }

  Widget _buildQuickPostCreator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAzkTIAN3P1LrcjypT83p2DomYGbHk6SwiAoDwf7-e0CDFomoz2-94-mG8QA2wuHm5HlD9jl6xA3p0vZHn50AgKvgjiA4ufcD3JAny23DdKZeHzFcEzObL4QCuqD8DM1sOW4TTWlOQiVuZabD6wMD4bKVng6FF6wANf4VijMz84JyRuG5mXiQOv5_NEUP2tC0wapT0gqPg9G1sj-mHMq6yhMimD-FT53Cc4c4eWHUE4xMTNPb9QZzKfb4ZpagSRZ40yq9RjWHFwHdk'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Komşularınla ne paylaşmak istersin?'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.image, color: AppColors.textGrey),
                            SizedBox(width: 8),
                            Icon(Icons.add_location, color: AppColors.textGrey),
                            SizedBox(width: 8),
                            Icon(Icons.mood, color: AppColors.textGrey),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: const StadiumBorder(),
                          ),
                          child: Text('Paylaş', style: AppTextStyles.button.copyWith(color: AppColors.textDark)),
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
        label: Text(label, style: AppTextStyles.button),
        selected: isSelected,
        onSelected: (bool selected) {},
        backgroundColor: AppColors.cardLight,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
            color:
                isSelected ? AppColors.textDark : AppColors.textGrey,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, Post post) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailPage(postId: post.id))),
      child: Card(
        color: AppColors.cardLight,
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
                                    style: AppTextStyles.title.copyWith(fontSize: 18)),
                                Text('${post.timeAgo} • ${post.category}',
                                    style: AppTextStyles.caption.copyWith(color: Colors.grey)),
                              ],
                            ),
                            const Icon(Icons.more_horiz),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(post.content, style: AppTextStyles.body),
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
                      const Icon(Icons.favorite_border, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(post.likeCount.toString(), style: AppTextStyles.body),
                      const SizedBox(width: 16),
                      const Icon(Icons.chat_bubble_outline, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(post.commentCount.toString(), style: AppTextStyles.body),
                    ],                  ),
                  const Icon(Icons.share, color: Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: AppColors.primaryWithOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.primaryWithOpacity(0.2))),
      child: Column(
        children: [
          Text("Mahalle Maçı",
              style: AppTextStyles.title.copyWith(color: AppColors.primary)),
          const SizedBox(height: 4),
          Text("Cumartesi • 10:00 • Akatlar Spor Parkı",
              style: AppTextStyles.caption.copyWith(color: AppColors.textGrey)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: const StadiumBorder(),
            ),
            child: Text('Katılıyorum',
                style: AppTextStyles.button.copyWith(color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }
}
