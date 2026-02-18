import 'package:dedikodu/data/models/backend_models/post_model.dart';
import 'package:dedikodu/presentation/controllers/post_detail_controller.dart';
import 'package:dedikodu/presentation/theme/app_colors.dart';
import 'package:dedikodu/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDetailPage extends StatelessWidget {
  final String postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostDetailController()..fetchPostDetails(postId),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gönderi Detayı", style: AppTextStyles.title),
        ),
        body: Consumer<PostDetailController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.post == null) {
              return const Center(child: Text("Gönderi bulunamadı."));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      _buildPostHeader(controller.post!),
                      const SizedBox(height: 16),
                      Text(controller.post!.content, style: AppTextStyles.body),
                      const SizedBox(height: 16),
                      if (controller.post!.imageUrl != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(controller.post!.imageUrl!)
                        ),
                      if (controller.post!.isEvent)
                        _buildEventBanner(),
                      const SizedBox(height: 16),
                      _buildPostStats(controller.post!),
                      const Divider(height: 32),
                      _buildCommentsSection(controller),
                    ],
                  ),
                ),
                _buildCommentInputField(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPostHeader(Post post) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(post.userAvatar)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.userName, style: AppTextStyles.bodyBold),
            Text(post.timeAgo, style: AppTextStyles.caption.copyWith(color: AppColors.textGrey)),
          ],
        ),
        const Spacer(),
        IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
      ],
    );
  }

  Widget _buildEventBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: AppColors.primaryWithOpacity(0.1),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: AppColors.primaryWithOpacity(0.2))),
      child: Column(
        children: [
          Text("Mahalle Maçı", style: AppTextStyles.title.copyWith(color: AppColors.primary)),
          const SizedBox(height: 4),
          Text("Cumartesi • 10:00 • Akatlar Spor Parkı", style: AppTextStyles.caption.copyWith(color: AppColors.textGrey)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: const StadiumBorder(),
            ),
            child: Text('Katılıyorum', style: AppTextStyles.button.copyWith(color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }

  Widget _buildPostStats(Post post) {
    return Row(
      children: [
        const Icon(Icons.favorite_border, color: AppColors.textGrey),
        const SizedBox(width: 4),
        Text('${post.likeCount} Beğeni', style: AppTextStyles.body.copyWith(color: AppColors.textGrey)),
        const SizedBox(width: 24),
        const Icon(Icons.chat_bubble_outline, color: AppColors.textGrey),
        const SizedBox(width: 4),
        Text('${post.commentCount} Yorum', style: AppTextStyles.body.copyWith(color: AppColors.textGrey)),
      ],
    );
  }

  Widget _buildCommentsSection(PostDetailController controller) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.comments.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final comment = controller.comments[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(comment.userAvatar)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.userName, style: AppTextStyles.bodyBold),
                  const SizedBox(height: 4),
                  Text(comment.text, style: AppTextStyles.body),
                  const SizedBox(height: 4),
                   Text(comment.timeAgo, style: AppTextStyles.caption.copyWith(color: AppColors.textGrey)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCommentInputField() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.cardLight,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Yorumunu yaz...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: AppColors.primary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
