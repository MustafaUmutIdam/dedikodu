class Post {
  final String id;
  final String userName;
  final String userAvatar;
  final String timeAgo;
  final String category;
  final String content;
  final String? imageUrl;
  final int likeCount;
  final int commentCount;
  final bool isEvent;

  Post({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.timeAgo,
    required this.category,
    required this.content,
    this.imageUrl,
    required this.likeCount,
    required this.commentCount,
    required this.isEvent,
  });
}
